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

class NewPasswordController extends GetxController {
  static Dio dio = Dio(dioOptions);
  BuildContext context = Get.context!;
  String ?fcm_token;
  final _firebaseMessaging = FirebaseMessaging.instance;

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  RxBool _passenable = true.obs;
  RxBool _confimPass = true.obs;
  final newKey = GlobalKey<FormState>();
  RxBool get confimPass => _confimPass;
  set confimPass(RxBool value) {
    _confimPass = value;
  }
  RxBool get passenable => _passenable;

  set passenable(RxBool value) {
    _passenable = value;
  }

  forgotUser() async {
    print("hhh");
    _firebaseMessaging.getToken().then((value) {print('Token: $value'); fcm_token = '$value';});
    try {
      LoadingUtils.showLoader();
      print("loader");
      var response = await dio.post(URLs.forgetPassword,
        data: {
          "phone_number":HiveUtils.getSession<String>(SessionKey.forgetPassNum),
          "password":confirmPassController.text.toString(),
          "fcm_token":fcm_token.toString(),
        },
      );
      if (response.statusCode == 200) {
        print("sucess");
        ApiResponse apiResponse = ApiResponse.fromJson(response.data);
        if (apiResponse.status == true) {
          print("sucess");
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

}
