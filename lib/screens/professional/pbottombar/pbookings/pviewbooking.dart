import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PViewBooking extends StatefulWidget {
  const PViewBooking({super.key});

  @override
  State<PViewBooking> createState() => _PViewBookingState();
}

class _PViewBookingState extends State<PViewBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: appBar(true, 'Harry Styles'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GetText(
                  text: '10th',
                  size: 18,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor),
              Row(
                children: const [
                  GetText(
                      text: 'Apr, Sunday',
                      size: 18,
                      fontFamily: popionsBold,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlackColor),
                  Spacer(),
                  GetText(
                      text: '02:30 pm',
                      size: 18,
                      fontFamily: popionsBold,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textBlackColor),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              buildCustomProduct(),
              const SizedBox(
                height: 16,
              ),
              buildCustomProduct(),
              const SizedBox(
                height: 24,
              ),
              billingDetails(),
              const SizedBox(
                height: 24,
              ),
              addressWidget(),
              const SizedBox(
                height: 55,
              ),
              customBtn('View feedback', AppColors.blackColor,
                  AppColors.whiteColor, () {}),
              const SizedBox(
                height: 15,
              ),
              bottomIndicatorWidget()
            ],
          ),
        ),
      ),
    );
  }

  buildCustomProduct() {
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

  billingDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.greyF3Color, width: 2)),
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Billing Details',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                  decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          customRowWidgetForBilling('Diamond Facial', '₹699'),
          const SizedBox(
            height: 4,
          ),
          customRowWidgetForBilling('Clean up', '₹499'),
          const SizedBox(
            height: 4,
          ),
          customRowWidgetForBilling('Convinience Fee', '₹50'),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: const [
                GetText(
                    text: 'Grand Total',
                    size: 14,
                    fontFamily: popionsBold,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlackColor),
                Spacer(),
                GetText(
                    text: '₹1148',
                    size: 14,
                    fontFamily: popionsBold,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textBlackColor)
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 47,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.greyF3Color,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                GetText(
                    text: 'Payment mode',
                    size: 14,
                    fontFamily: popionsRegular,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlackColor),
                Spacer(),
                GetText(
                    text: 'Cash',
                    size: 14,
                    fontFamily: popionsRegular,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlackColor)
              ],
            ),
          )
        ],
      ),
    );
  }

  addressWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.greyF3Color, width: 2)),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 12, bottom: 16),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icon/homeicon.png',
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  GetText(
                      text: 'Home',
                      size: 14,
                      fontFamily: popionsMedium,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlackColor),
                  GetText(
                      text:
                          '89, Bhel Nagar, Piplani, Ayodhya Bypass, Bhopal,Madhya Pradesh 462022, India ',
                      size: 12,
                      fontFamily: popionsRegular,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGreyColor),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Image.asset(
              'assets/icon/clockicon.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const GetText(
                text: 'Sat, Apr 09 - 07:30 PM',
                size: 12,
                fontFamily: popionsRegular,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlackColor)
          ],
        )
      ]),
    );
  }

  customRowWidgetForBilling(String title1, String title2) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          GetText(
              text: title1,
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor),
          const Spacer(),
          GetText(
              text: title2,
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor)
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
