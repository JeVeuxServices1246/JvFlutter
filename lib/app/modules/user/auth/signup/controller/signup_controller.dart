import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/data/models/dto/genric_response.dart';
import 'package:jv_app/app/data/models/dto/user_model.dart';
import 'package:jv_app/app/data/models/response/UserRegistrationResponse.dart';
import 'package:jv_app/app/data/values/dio_options.dart';
import 'package:jv_app/app/data/values/urls.dart';
import 'package:jv_app/app/modules/user/auth/views/verification_screen.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/utils/helper/exception_helper.dart';
import 'package:jv_app/utils/hive_utils.dart';
import 'package:jv_app/utils/loader/loader_utils.dart';
import 'package:jv_app/utils/session_key.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';

class SignupController extends GetxController {
  static Dio dio = Dio(dioOptions);
  BuildContext context = Get.context!;
  String ?fcm_token;
  final _firebaseMessaging = FirebaseMessaging.instance;

  TextEditingController mobileController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxBool _passenable = true.obs;
  RxBool _confimPass = true.obs;
  RxString dialCode = "1".obs;
  RxString countryName = "Canada".obs;
  final signupKey = GlobalKey<FormState>();
  final upKey = GlobalKey<FormState>();
  RxString otp = "".obs;
  RxInt currentOtp = 0.obs;
  RxBool get confimPass => _confimPass;
  set confimPass(RxBool value) {
    _confimPass = value;
  }
  RxBool get passenable => _passenable;

  set passenable(RxBool value) {
    _passenable = value;
  }

  registerUser() async {
    print("hhh");
    _firebaseMessaging.getToken().then((value) {print('Token: $value'); fcm_token = '$value';});
    try {
      LoadingUtils.showLoader();
      print("loader");
      var response = await dio.post(URLs.registration,
        data: {
          "phone_number":mobileController.text.toString(),
          "password":confirmPassController.text.toString(),
          "first_name":firstNameController.text.toString(),
          "last_name":lastNameController.text.isEmpty?null:lastNameController.text.toString(),
          "email":emailController.text.isEmpty?null:emailController.text.toString(),
          "country_code":dialCode.toString(),
          "fcm_token":fcm_token.toString(),
        },
      );
      if (response.statusCode == 200) {
        print("sucess");
        final apiResponse = ApiResponse.fromJson(response.data);
        if (apiResponse.status == true) {
          print("sucess");
          final UserRegistrationResponse data =
              UserRegistrationResponse.fromJson(apiResponse.data);
          HiveUtils.addSession(SessionKey.isLoggedIn, true);
          HiveUtils.addSession(SessionKey.firstName, data.userData?.firstName);
          HiveUtils.addSession(SessionKey.lastname, data.userData?.lastName);
          HiveUtils.addSession(SessionKey.phonenum, data.userData?.phoneNumber);
          HiveUtils.addSession(SessionKey.countrycode, data.userData?.countryCode);
          HiveUtils.addSession(SessionKey.email, data.userData?.email);
          HiveUtils.addSession(SessionKey.token, data.token);
          data.userData?.username==null? HiveUtils.addSession(SessionKey.username,""):
          HiveUtils.addSession(SessionKey.username, data.userData?.username);
          LoadingUtils.hideLoader();
          // Storage.setUser(User(
          //   userEmail: data.userData?.email,
          //   phoneNumber: data.userData?.phoneNumber,
          //   firstName: data.userData?.firstName,
          //   lastName: data.userData?.lastName,
          //   userName: data.userData?.username,
          //   countryCode: data.userData?.countryCode.toString(),
          //   token: data.token,
          //   isUserLogin: true,
          // ));
          Get.offAllNamed(MyRouter.homeScreen);
        } else {
          Fluttertoast.showToast(msg:apiResponse.message);
          LoadingUtils.hideLoader();
        }
      } else {
        LoadingUtils.hideLoader();
      }
    } on DioError catch (exception) {
      LoadingUtils.hideLoader();
      ExceptionHandler.handleError(exception);
    }
  }

  sendOTP(bool status) async {
    LoadingUtils.showLoader();
    try {
      var response = await dio.post(URLs.sentOtp,
          data: {"phone_number": mobileController.text.toString(),
                  "country_code":dialCode.toString(),
                   "forgot_password":status
          });
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse.fromJson(response.data);
        if (apiResponse.status == true) {
          LoadingUtils.hideLoader();
          currentOtp.value = apiResponse.data['otp'];
          if(Get.arguments=="forget password")
          {
            Get.to(const VerificationScreen(),arguments:"forget password");
          }else{
            Get.to(const VerificationScreen(),arguments:"registration");
          }
        } else {
          LoadingUtils.hideLoader();
          Fluttertoast.showToast(msg: apiResponse.message);
        }
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong');
        LoadingUtils.hideLoader();
      }
    } on DioError catch (exception) {
      if (LoadingUtils.isLoaderShowing) {
        LoadingUtils.hideLoader();
      }
      ExceptionHandler.handleError(exception);
    }
  }
  resendSendOTP(bool status) async {
    LoadingUtils.showLoader();
    try {
      var sendOtpResponse = await dio.post(
        URLs.sentOtp,
        data:{"phone_number": mobileController.text.toString(),
          "country_code":dialCode.toString(),
          "forgot_password":status
        },
      );
      var sendOtpData = jsonDecode(sendOtpResponse.toString());
      if (sendOtpData["status"] == true) {
        LoadingUtils.hideLoader();
        currentOtp.value = sendOtpData["data"]['otp'];
        otp.value=sendOtpData["data"]['otp'].toString();
      } else {
        Fluttertoast.showToast(msg:sendOtpData["message"].toString());
        LoadingUtils.hideLoader();
      }
    } on DioError catch (e) {
      if (LoadingUtils.isLoaderShowing) {
        LoadingUtils.hideLoader();
      }
      ExceptionHandler.handleError(e);
    }
  }
}
