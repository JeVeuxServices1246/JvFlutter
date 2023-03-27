import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewServiceControllr extends GetxController {
  // final selectTabBar = false.obs;
  final selectTabBar = 0.obs;
  changeValue(value) {
    selectTabBar(value);
  }
}
