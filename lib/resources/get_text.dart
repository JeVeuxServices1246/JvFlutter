import 'package:flutter/material.dart';

class GetText extends StatelessWidget {
  final String text;
  final double size;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color color;
  const GetText(
      {super.key,
      required this.text,
      required this.size,
      required this.fontFamily,
      required this.fontWeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
