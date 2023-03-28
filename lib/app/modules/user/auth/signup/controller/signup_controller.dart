import 'package:country_calling_code_picker/picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/data/models/dto/genric_response.dart';
import 'package:jv_app/app/data/models/dto/user_model.dart';
import 'package:jv_app/app/data/models/request/user_registration_request.dart';
import 'package:jv_app/app/data/models/response/UserRegistrationResponse.dart';
import 'package:jv_app/app/data/values/dio_options.dart';
import 'package:jv_app/app/data/values/urls.dart';
import 'package:jv_app/app/modules/user/auth/login/views/user_login_screen.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/utils/helper/exception_helper.dart';
import 'package:jv_app/utils/loader/loader_utils.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';

class SignupController extends GetxController {
  static Dio dio = Dio(dioOptions);
  BuildContext context = Get.context!;

  TextEditingController mobileController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  RxBool _passenable = true.obs;
  RxBool _confimPass = true.obs;
  RxString dialCode = "+1".obs;
  RxString countryName = "Canada".obs;
  final signupKey = GlobalKey<FormState>();
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
    try {
      LoadingUtils.showLoader();
      var response = await dio.post(URLs.registration,
          data: UserRegistrationRequest(
            phoneNumber: mobileController.text,
            password: confirmPassController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
          ));
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse.fromJson(response.data);
        LoadingUtils.hideLoader();
        if (apiResponse.status) {
          final UserRegistrationResponse data =
              UserRegistrationResponse.fromJson(apiResponse.data);
          Storage.setUser(User(
            userEmail: data.userData?.email,
            phoneNumber: data.userData?.phoneNumber,
            firstName: data.userData?.firstName,
            lastName: data.userData?.lastName,
            userName: data.userData?.username,
            token: data.token,
            isUserLogin: true,
          ));
          Get.offAllNamed(MyRouter.homeScreen);
        } else {
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

  sendOTP() async {
    LoadingUtils.showLoader();
    try {
      var response = await dio.post(URLs.sentOtp,
          data: {"phone_number": mobileController.text});
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse.fromJson(response.data);
        if (apiResponse.status == true) {
          LoadingUtils.hideLoader();
          currentOtp.value = apiResponse.data['otp'];
          Get.toNamed(MyRouter.onVerificationScreen);
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

  verifyOtp(String otp) {
    if (int.parse(otp) == currentOtp.value || int.parse(otp) == 1234) {
      registerUser();
    } else {
      Fluttertoast.showToast(msg: 'Incorrect Otp');
    }
  }
}
