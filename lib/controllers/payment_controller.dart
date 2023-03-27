import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final radioValue = 10.obs;
  changeValue(value) {
    radioValue(value);
  }
}
