import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PDelayBookingController extends GetxController {
  // final selectTabBar = false.obs;
  final selectedRadio = 0.obs;
  final selectedTime = 10.obs;
  changeValue(value) {
    selectedTime(value);
  }

  changedRadioValue(value) {
    selectedRadio(value);
  }
}
