import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';

class PCustomProductWidget extends StatefulWidget {
  final String title;
  PCustomProductWidget(this.title);

  @override
  State<PCustomProductWidget> createState() => _PCustomProductWidgetState();
}

class _PCustomProductWidgetState extends State<PCustomProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: const Color(0xffF3F3F3))),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset(
            'assets/images/facial.png',
            height: 100,
            width: 100,
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetText(
                    text: 'Diamond Facial',
                    size: 14,
                    fontFamily: popionsBold,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlackColor),
                customRowWidgetForProduct('2 hrs'),
                customRowWidgetForProduct('Includes dummy info'),
              ],
            ),
          )
        ],
      ),
    );
  }

  customRowWidgetForProduct(String title) {
    return Row(
      children: [
        Container(
          height: 4,
          width: 4,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.lightGreyColor),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: GetText(
              text: title,
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor),
        )
      ],
    );
  }
}
