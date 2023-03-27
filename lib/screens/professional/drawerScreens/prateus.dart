import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:dotted_line/dotted_line.dart';

class PRateUs extends StatefulWidget {
  const PRateUs({super.key});

  @override
  State<PRateUs> createState() => _PRateUsState();
}

class _PRateUsState extends State<PRateUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(true, 'Rate card'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            serviceEarningWidget(),
            const SizedBox(
              height: 16,
            ),
            dailyTargetWidget()
          ],
        ),
      ),
    );
  }

  serviceEarningWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xffF2ECFD))),
      child: Column(
        children: [
          commonHeaderUI(
              const Color(0xffF2ECFD),
              const Color(0xff8C52FF),
              'Service Earning',
              'earnings per job',
              'assets/icon/serviceicon.png'),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    GetText(
                        text: 'Total Distance pay',
                        size: 14,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlackColor),
                    GetText(
                        text: 'for total distance travelled',
                        size: 12,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGreyColor),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(
                      left: 8, top: 7, bottom: 4, right: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greyF3Color),
                  child: Row(
                    children: const [
                      GetText(
                          text: '+ ₹5.25',
                          size: 16,
                          fontFamily: popionsBold,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor),
                      SizedBox(
                        width: 7,
                      ),
                      GetText(
                          text: 'per km',
                          size: 12,
                          fontFamily: popionsMedium,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGreyColor)
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 14),
            child: DottedLine(
              dashColor: Color(0xffF2ECFD),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14),
            child: Row(
              children: const [
                GetText(
                    text: 'Incentive distance pay',
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
                Spacer(),
                GetText(
                    text: '₹0.35',
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
                SizedBox(
                  width: 4,
                ),
                GetText(
                    text: 'per km',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14),
            child: Row(
              children: const [
                GetText(
                    text: 'Base distance pay',
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
                Spacer(),
                GetText(
                    text: '₹5',
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
                SizedBox(
                  width: 4,
                ),
                GetText(
                    text: 'per km',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 14),
            child: DottedLine(
              dashColor: Color(0xffF2ECFD),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    GetText(
                        text: 'Minimum base pay',
                        size: 14,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlackColor),
                    GetText(
                        text: 'guranteed pay for service',
                        size: 12,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGreyColor),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(
                      left: 8, top: 7, bottom: 4, right: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greyF3Color),
                  child: Row(
                    children: const [
                      GetText(
                          text: '+ ₹15',
                          size: 16,
                          fontFamily: popionsBold,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor),
                      SizedBox(
                        width: 7,
                      ),
                      GetText(
                          text: 'per km',
                          size: 12,
                          fontFamily: popionsMedium,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGreyColor)
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  dailyTargetWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffD2EBFF))),
      child: Column(
        children: [
          commonHeaderUI(
              const Color(0xffD2EBFF),
              const Color(0xff2B95E9),
              'Daily Target Pay',
              'for reaching job pay targets',
              'assets/icon/dailytargeticon.png'),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 12),
            child: GetText(
                text: 'Only one of these targets can be earned in a day',
                size: 12,
                fontFamily: popionsMedium,
                fontWeight: FontWeight.w500,
                color: Color(0xff2B95E9)),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    GetText(
                        text: 'Daily',
                        size: 14,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textBlackColor),
                    GetText(
                        text: '12am - 11:59pm',
                        size: 12,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightGreyColor),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(
                      left: 8, top: 7, bottom: 4, right: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greyF3Color),
                  child: Row(
                    children: const [
                      GetText(
                          text: 'up to',
                          size: 12,
                          fontFamily: popionsMedium,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGreyColor),
                      SizedBox(
                        width: 3,
                      ),
                      GetText(
                          text: '₹300',
                          size: 16,
                          fontFamily: popionsBold,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlackColor),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          targetTrackerUI(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  targetTrackerUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 12),
      child: Column(
        children: [
          Row(
            children: const [
              SizedBox(
                width: 100,
                child: GetText(
                    text: 'Target Pay',
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹160',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              Spacer(),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹160',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              Spacer(),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹160',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              Spacer(),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹160',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Container(
                width: 105,
                height: 4,
                decoration: const BoxDecoration(color: AppColors.greyF3Color),
              ),
              Container(
                height: 10,
                width: 13,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff2B95E9)),
              ),
              Container(
                width: 40,
                height: 4,
                decoration: const BoxDecoration(color: AppColors.greyF3Color),
              ),
              Container(
                height: 10,
                width: 13,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff2B95E9)),
              ),
              Container(
                width: 40,
                height: 4,
                decoration: const BoxDecoration(color: AppColors.greyF3Color),
              ),
              Container(
                height: 10,
                width: 13,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff2B95E9)),
              ),
              Container(
                width: 45,
                height: 4,
                decoration: const BoxDecoration(color: AppColors.greyF3Color),
              ),
              Container(
                height: 10,
                width: 13,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff2B95E9)),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: const [
              SizedBox(
                width: 82,
                child: GetText(
                    text: 'Order Pay',
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              Spacer(),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹165*',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              Spacer(),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹165*',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              Spacer(),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹165*',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
              Spacer(),
              SizedBox(
                width: 40,
                child: GetText(
                    text: '₹165*',
                    size: 12,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGreyColor),
              ),
            ],
          )
        ],
      ),
    );
  }

  commonHeaderUI(Color color, Color imgContainerColor, String title,
      String subTitle, String img) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(color: imgContainerColor, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Image.asset(
              img,
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetText(
                  text: title,
                  size: 16,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor),
              GetText(
                  text: subTitle,
                  size: 12,
                  fontFamily: popionsMedium,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor),
            ],
          )
        ],
      ),
    );
  }
}
