import 'package:get/get.dart';

class PHomeController extends GetxController {
  final isOnline = true.obs;
  changeValue(value) {
    isOnline(value);
  }
}
