import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PBookingController extends GetxController {
  final selectTabBar = 0.obs;
  changeValue(value) {
    selectTabBar(value);
  }
}
