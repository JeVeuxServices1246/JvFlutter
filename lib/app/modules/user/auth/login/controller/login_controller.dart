import 'dart:convert';

import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:jv_app/utils/hive_utils.dart';
import 'package:jv_app/utils/loader/loader_utils.dart';
import 'package:jv_app/utils/session_key.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';

class LoginController extends GetxController {
  static Dio dio = Dio(dioOptions);
  BuildContext context = Get.context!;
  TextEditingController passController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  RxBool _passenable = true.obs;
  String ?fcm_token;
  final _firebaseMessaging = FirebaseMessaging.instance;
  RxString dialCode = "1".obs;
  RxString countryName = "Canada".obs;
  final loginKey = GlobalKey<FormState>();
  RxInt currentOtp = RxInt(0000);
  RxBool get passenable => _passenable;

  set passenable(RxBool value) {
    _passenable = value;
  }

  Rx<Country> selectedCountry =
      Rx(Country('Afghanistan', 'flags/afg.png', 'AF', '+93'));

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    mobileController.clear();
    passController.clear();
    super.dispose();
  }

  signIn() async {
    final token = _firebaseMessaging.getToken().then((value) {print('Token: $value'); fcm_token = '$value';});
    try {
      LoadingUtils.showLoader();
      var response = await dio.post(
        URLs.login,
        data:jsonEncode({
          "phone_number": mobileController.text.toString(),
          "password": passController.text.toString(),
          "fcm_token":fcm_token,
          "country_code":dialCode.toString(),

        })
      );
      print( jsonEncode({
        "phone_number": mobileController.text.toString(),
        "password": passController.text.toString(),
        "fcm_token":fcm_token,
        "country_code":dialCode.toString(),

      }));
      if (response.statusCode == 200) {
        ApiResponse apiResponse = ApiResponse.fromJson(response.data);
        if (apiResponse.status) {
          UserRegistrationResponse data =
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
  }
  }
