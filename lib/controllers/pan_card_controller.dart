import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PanCardController extends GetxController {
  final panCardController = TextEditingController();

  bool selectCheckBox = false;
  onChangedValue(value) {
    selectCheckBox = value;
  }
}
