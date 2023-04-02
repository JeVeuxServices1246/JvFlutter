import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jv_app/app/data/values/dio_options.dart';
import 'package:jv_app/app/data/values/urls.dart';
import 'package:jv_app/utils/hive_utils.dart';
import 'package:jv_app/utils/session_key.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';

import '../../../../utils/helper/exception_helper.dart';
import '../../../../utils/loader/loader_utils.dart';
import '../../../data/models/dto/genric_response.dart';
import '../../../data/models/dto/user_model.dart';
import '../../../data/models/response/UserRegistrationResponse.dart';

import 'package:jv_app/utils/storage/storage_utils.dart';

class BecomeProviderController extends GetxController {
  static dio.Dio dioInstance = dio.Dio(dioOptions);

  TextEditingController mobileController =
  TextEditingController(text: HiveUtils.getSession<String>(SessionKey.firstName,defaultValue:""));
  TextEditingController userNameController =
  TextEditingController(text: HiveUtils.getSession<String>(SessionKey.username,defaultValue:"null"));
  TextEditingController emailController =
  TextEditingController(text:HiveUtils.getSession<String>(SessionKey.email,defaultValue:""));
  TextEditingController firstNameController =
  TextEditingController(text: HiveUtils.getSession<String>(SessionKey.firstName,defaultValue:""));
  TextEditingController lastNameController =
  TextEditingController(text: HiveUtils.getSession<String>(SessionKey.lastname,defaultValue:""));
  RxBool showOtp = false.obs;
  TextEditingController otpController = TextEditingController();

  void showOtpRow() {
    showOtp.value = true;
  }

  void hideOtpRow() {
    showOtp.value = false;
  }

  final ImagePicker _picker = ImagePicker();

  final Rx<XFile?> backDl = XFile("").obs;
  final Rx<XFile?> frontDl = XFile("").obs;

  RxString frontDlImagePath = RxString('');
  RxString backDlImagePath = RxString('');

  pickImage(bool isFront) async {
    print(Storage.getUser().token);
    try {
      if (isFront) {
        frontDl.value = await _picker.pickImage(source: ImageSource.gallery);
      } else {
        backDl.value =
            await _picker.pickImage(source: ImageSource.gallery) ?? XFile("");
      }
    } catch (e) {
      print(e);
    }
  }

  registerProvider() async {}

  Future<void> uploadImage(XFile imageFile) async {
    try {
      String fileName = imageFile.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'file': await dio.MultipartFile.fromFile(imageFile.path,
            filename: fileName),
      });
      String accessToken = Storage.getUser().token ?? '';
      var response = await dioInstance.post(
        URLs.apiUploadImage,
        data: formData,
      );
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  UpdateProfile() async {
    try {
      LoadingUtils.showLoader();

      String accessToken = HiveUtils.getSession<String>(SessionKey.token,defaultValue:"");
      dioInstance.options.headers["authorization"]="token ${accessToken}";
      var response = await dioInstance.post(
        URLs.update_profile,
        data: jsonEncode(
            {
              "phone_number": mobileController.text,
              "first_name": firstNameController.text,
              "last_name": lastNameController.text,
              "email": emailController.text
            }
        ),
      );
      if (response.statusCode == 200) {
        print(response);
        print(response.data);
        // ApiResponse apiResponse = ApiResponse.fromJson(response.data);
        if (response.statusCode == 200) {
          // print(apiResponse);
          // UserRegistrationResponse data =
          // UserRegistrationResponse.fromJson(apiResponse.data);
          // Storage.setUser(User(
          //   phoneNumber: data.userData?.phoneNumber,
          //   firstName: data.userData?.firstName,
          //   lastName: data.userData?.lastName,
          //   userName: data.userData?.username,
          //   isUserLogin: true,
          //   token: data.token,
          //   countryCode: data.userData?.countryCode,
          //   userEmail: data.userData?.email,
          // ));
          // print(Storage.isUserExists());
          LoadingUtils.hideLoader();
          // Get.offAllNamed(MyRouter.homeScreen);
        } else {
          LoadingUtils.hideLoader();
          // Fluttertoast.showToast(msg: apiResponse.message);
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
