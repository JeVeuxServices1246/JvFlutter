import 'package:flutter/material.dart';

bottomIndicatorWidget() {
  return Container(
    alignment: Alignment.center,
    height: 20,
    child: Container(
      height: 5,
      width: 134,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Color(0xff222222)),
    ),
  );
}
