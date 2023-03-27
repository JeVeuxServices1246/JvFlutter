import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PBottombarController extends GetxController {
  final isOnline = true.obs;
  final currentTab = 0.obs;
  changeValue(value) {
    isOnline(value);
  }

  changeTabValue(value) {
    currentTab(value);
  }
}
