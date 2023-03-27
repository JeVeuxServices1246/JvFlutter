import 'package:flutter/material.dart';
import 'package:get/get.dart';

class POfflineController extends GetxController {
  final selected = 0.obs;
  changeValue(value) {
    selected(value);
  }
}
