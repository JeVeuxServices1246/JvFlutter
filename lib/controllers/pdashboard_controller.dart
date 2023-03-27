import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PDashBoardController extends GetxController {
  final currentTab = 0.obs;

  changeTabValue(value) {
    currentTab(value);
  }
}
