import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  openDrawerFromController() {
    scaffoldKey.currentState!.openDrawer();
  }

  RxInt currentIndex = 0.obs;

  changeIndex(int value) {
    currentIndex.value = value;
    FocusManager.instance.primaryFocus!.unfocus();
    update();
  }

  removeFocus() {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
