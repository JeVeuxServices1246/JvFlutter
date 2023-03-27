import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';

Widget customBtn(String title, Color color, Color textColor, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: GetText(
            text: title,
            size: 14,
            fontFamily: popionsMedium,
            fontWeight: FontWeight.w500,
            color: textColor)),
  );
}
