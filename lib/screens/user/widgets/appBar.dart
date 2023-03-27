import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';

AppBar appBar(bool isLeading, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: !isLeading
        ? Container()
        : InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.all(6),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffF3F3F3)),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icon/keyboard_arrowback.png',
                height: 20,
                width: 20,
              ),
            ),
          ),
    centerTitle: true,
    title: GetText(
        text: title,
        size: 20,
        fontFamily: popionsBold,
        fontWeight: FontWeight.w700,
        color: const Color(0xff000000)),
  );
}
