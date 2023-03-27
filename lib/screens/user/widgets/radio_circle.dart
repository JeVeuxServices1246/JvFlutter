import 'package:flutter/material.dart';

import '../../../resources/app_theme.dart';
import '../../../resources/dimensions.dart';

class RadioCircle extends StatelessWidget {
  final bool selected;
  const RadioCircle({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: AddSize.size18,
      height: AddSize.size18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.2, color: Colors.black),
      ),
      padding: EdgeInsets.all(
          selected == true ? AddSize.size10 * .26 : AddSize.size22 * .6),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff5E17EB),
        ),
      ),
    );
  }
}
