import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  final selected = 0.obs;
  changeValue(value) {
    selected(value);
  }
}
