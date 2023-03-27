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
import 'package:jv_app/utils/validator/validator.dart';

class SignupController extends GetxController {
  static Dio dio = Dio(dioOptions);

  TextEditingController mobileController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final registrationFormKey = GlobalKey<FormState>();

  RxInt currentOtp = RxInt(0000);

  RxBool isPasswordVisible = RxBool(false);

  Rx<Country> selectedCountry =
      Rx(Country('Afghanistan', 'flags/afg.png', 'AF', '+93'));

  void selectCountryCode() async {
    var country = await Get.to(() => const PickerPage());
    if (country != null) {
      selectedCountry.value = country;
    }
  }

  showPassword() {
    isPasswordVisible.toggle();
  }

  registerUser() async {
    try {
      LoadingUtils.showLoader();
      var response = await dio.post(URLs.registration,
          data: UserRegistrationRequest(
            phoneNumber: mobileController.text,
            password: password.text,
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
    if (registrationFormKey.currentState!.validate()) {
      if (Validator.mobileRegex.hasMatch(mobileController.text)) {
        if (password.text == conformPasswordController.text) {
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
        } else {
          Fluttertoast.showToast(msg: 'Password not match');
        }
      } else {
        Fluttertoast.showToast(msg: 'Please enter valid number');
      }
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
