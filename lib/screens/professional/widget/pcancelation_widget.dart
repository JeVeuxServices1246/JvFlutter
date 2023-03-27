import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';

class PCancelationWidget extends StatefulWidget {
  const PCancelationWidget({super.key});

  @override
  State<PCancelationWidget> createState() => _PCancelationWidgetState();
}

class _PCancelationWidgetState extends State<PCancelationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          cancelledWidget(),
          const SizedBox(
            height: 16,
          ),
          cancelledWidget(),
        ],
      ),
    );
  }

  cancelledWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: const Color(0xffEBEBEB),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GetText(
              text: 'Tom Louis',
              size: 20,
              fontFamily: popionsBold,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor),
          const GetText(
              text: '10 Apr, 02:30 pm',
              size: 14,
              fontFamily: popionsMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.textBlackColor),
          const SizedBox(
            height: 12,
          ),
          customRowWidgetForComplete('Facial for glow - Gold facial'),
          customRowWidgetForComplete('Threading'),
          const SizedBox(
            height: 22,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5),
              color: Color(0xffABABAB),
            ),
            padding: const EdgeInsets.all(5),
            child: const GetText(
                text: 'Reason for cancellation',
                size: 14,
                fontFamily: popionsRegular,
                fontWeight: FontWeight.w400,
                color: Color(0xffEBEBEB)),
          ),
          const SizedBox(
            height: 10,
          ),
          const GetText(
              text:
                  'The reason for cancellation  of booking willbe displayed here',
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor)
        ],
      ),
    );
  }

  customRowWidgetForComplete(String title) {
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
        GetText(
            text: title,
            size: 14,
            fontFamily: popionsRegular,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGreyColor)
      ],
    );
  }
}
