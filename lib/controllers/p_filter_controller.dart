import 'package:get/get.dart';

class PFilterController extends GetxController {
  final selectedFilterIndex = 0.obs;
  final selectedCheckbox = 0.obs;
  changeValue(value) {
    selectedFilterIndex(value);
  }

  onChangedCheckbox(value) {
    selectedCheckbox(value);
  }
}
