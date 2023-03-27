import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/data/models/dto/genric_response.dart';
import 'package:jv_app/app/data/models/dto/user_model.dart';
import 'package:jv_app/app/data/models/request/user_login_request.dart';
import 'package:jv_app/app/data/models/response/UserRegistrationResponse.dart';
import 'package:jv_app/app/data/values/dio_options.dart';
import 'package:jv_app/app/data/values/urls.dart';
import 'package:jv_app/app/modules/user/auth/login/views/user_login_screen.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/utils/helper/exception_helper.dart';
import 'package:jv_app/utils/loader/loader_utils.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';
import 'package:jv_app/utils/validator/validator.dart';

class LoginController extends GetxController {
  static Dio dio = Dio(dioOptions);
  BuildContext context = Get.context!;

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpTextController = TextEditingController();

  RxInt currentOtp = RxInt(0000);

  Rx<Country> selectedCountry =
      Rx(Country('Afghanistan', 'flags/afg.png', 'AF', '+93'));

  @override
  void onInit() {
    initCountry();
    super.onInit();
  }

  @override
  void dispose() {
    mobileController.clear();
    passwordController.clear();
    super.dispose();
  }

  void initCountry() async {
    final Country country = await getDefaultCountry(context);
    selectedCountry.value = country;
  }

  void selectCountryCode() async {
    var country =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const PickerPage();
    }));
    if (country != null) {
      selectedCountry.value = country;
    }
  }

  // sendOTP() async {
  //   if (Validator.mobileRegex.hasMatch(mobileController.text)) {
  //     LoadingUtils.showLoader();
  //     var response = await dio
  //         .post(URLs.sentOtp, data: {"phone_number": mobileController.text});
  //     final apiResponse = ApiResponse.fromJson(response.data);
  //     if (apiResponse.status == true) {
  //       LoadingUtils.hideLoader();
  //       currentOtp.value = apiResponse.data['otp'];
  //       Fluttertoast.showToast(
  //           msg: "Otp Sent",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //       Get.offAllNamed(MyRouter.onVerificationScreen);
  //     } else {
  //       LoadingUtils.hideLoader();
  //       Fluttertoast.showToast(msg: apiResponse.message);
  //     }
  //   } else {
  //     Fluttertoast.showToast(msg: 'invalid Number');
  //   }
  // }
  //
  // verifyOtp() {
  //   if (otpTextController.text.isNotEmpty) {
  //     if (int.parse(otpTextController.text) == currentOtp.value ||
  //         int.parse(otpTextController.text) == 1234) {
  //       Storage.setUser(User(
  //         isUserLogin: true,
  //       ));
  //       Get.offAllNamed(MyRouter.bottomNavBarHomeScreen);
  //     } else {
  //       Fluttertoast.showToast(msg: 'Incorrect Otp');
  //     }
  //   }
  // }

  signIn() async {
    if (Validator.mobileRegex.hasMatch(mobileController.text)) {
      if (passwordController.text.isNotEmpty) {
        try {
          LoadingUtils.showLoader();
          var response = await dio.post(
            URLs.login,
            data: UserLoginRequest(
              phone: mobileController.text,
              password: passwordController.text,
            ),
          );
          if (response.statusCode == 200) {
            ApiResponse apiResponse = ApiResponse.fromJson(response.data);
            if (apiResponse.status) {
              UserRegistrationResponse data =
                  UserRegistrationResponse.fromJson(apiResponse.data);
              Storage.setUser(User(
                phoneNumber: data.userData?.phoneNumber,
                firstName: data.userData?.firstName,
                lastName: data.userData?.lastName,
                userName: data.userData?.username,
                isUserLogin: true,
                token: data.token,
                userEmail: data.userData?.email,
              ));
              LoadingUtils.hideLoader();
              Get.offAllNamed(MyRouter.homeScreen);
            } else {
              LoadingUtils.hideLoader();
              Fluttertoast.showToast(msg: apiResponse.message);
            }
          } else {
            LoadingUtils.hideLoader();
          }
        } on DioError catch (exception) {
          LoadingUtils.hideLoader();
          ExceptionHandler.handleError(exception);
        }
      } else {
        Fluttertoast.showToast(msg: 'enter password');
      }
    } else {
      Fluttertoast.showToast(msg: 'enter valid mobile');
    }
  }
}
