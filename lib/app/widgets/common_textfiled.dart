import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';

class CommonTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CommonTextFiled(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      padding: const EdgeInsets.only(left: 16, right: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff79747E))),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
            fontSize: 16,
            color: AppColors.textBlackColor,
            fontWeight: FontWeight.w600,
            fontFamily: popionsBold),
        cursorColor: const Color(0xff79747E),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff79747E),
                fontFamily: popionsMedium)),
      ),
    );
  }
}
