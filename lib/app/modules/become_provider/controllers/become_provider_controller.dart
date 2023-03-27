import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jv_app/app/data/values/dio_options.dart';
import 'package:jv_app/app/data/values/urls.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';

class BecomeProviderController extends GetxController {
  static dio.Dio dioInstance = dio.Dio(dioOptions);

  TextEditingController mobileController =
      TextEditingController(text: Storage.getUser().phoneNumber);
  TextEditingController emailController =
      TextEditingController(text: Storage.getUser().userEmail);
  TextEditingController firstNameController =
      TextEditingController(text: Storage.getUser().firstName);
  TextEditingController lastNameController =
      TextEditingController(text: Storage.getUser().lastName);

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
}
