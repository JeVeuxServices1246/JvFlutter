import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';

class PWallet extends StatefulWidget {
  const PWallet({super.key});

  @override
  State<PWallet> createState() => _PWalletState();
}

class _PWalletState extends State<PWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            walletBalance(),
            const SizedBox(
              height: 45,
            ),
            transcationHistoryWidget(),
            const SizedBox(
              height: 14,
            ),
            dateWidget('05 feb 2022'),
            const SizedBox(
              height: 16,
            ),
            serviceUIWidget(),
            const SizedBox(
              height: 16,
            ),
            dateWidget('03 feb 2022'),
            const SizedBox(
              height: 16,
            ),
            transcationWidget(
                'assets/icon/addmoney.png',
                'Money added to the wallet',
                '09:43 pm',
                '+ ₹1000',
                const Color(0xff52B46B)),
            const SizedBox(
              height: 16,
            ),
            transcationWidget(
                'assets/icon/receivedmoney.png',
                'Money recieved in cash for dash service',
                '11:40 am',
                '- ₹1500',
                const Color(0xffEA3356)),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  dateWidget(String date) {
    return Container(
      width: double.infinity,
      height: 46,
      color: AppColors.greyF3Color,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16),
      child: GetText(
          text: date,
          size: 12,
          fontFamily: popionsBold,
          fontWeight: FontWeight.w700,
          color: AppColors.lightGreyColor),
    );
  }

  serviceUIWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/facial.png',
            height: 70,
            width: 70,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            GetText(
                text: 'Recieved for Facial \nservice',
                size: 14,
                fontFamily: popionsMedium,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor),
            GetText(
                text: '11:58 am',
                size: 12,
                fontFamily: popionsRegular,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGreyColor),
          ],
        ),
        const Spacer(),
        const GetText(
            text: '+ ₹499',
            size: 15,
            fontFamily: popionsBold,
            fontWeight: FontWeight.w700,
            color: Color(0xff52B46B))
      ]),
    );
  }

  transcationWidget(
      String img, String title, String time, String price, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
                color: AppColors.greyF3Color, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Image.asset(
              img,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetText(
                    text: title,
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlackColor),
                GetText(
                    text: time,
                    size: 12,
                    fontFamily: popionsRegular,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGreyColor)
              ],
            ),
          ),
          const Spacer(),
          GetText(
              text: price,
              size: 15,
              fontFamily: popionsBold,
              fontWeight: FontWeight.w700,
              color: color)
        ],
      ),
    );
  }

  transcationHistoryWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const GetText(
              text: 'Transaction history',
              size: 16,
              fontFamily: popionsBold,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor),
          const Spacer(),
          const GetText(
              text: 'Filter',
              size: 12,
              fontFamily: popionsMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.lightGreyColor),
          const SizedBox(
            width: 9,
          ),
          Image.asset(
            'assets/icon/filter.png',
            height: 18,
            width: 18,
          )
        ],
      ),
    );
  }

  walletBalance() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.blackColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: GetText(
                text: 'Wallet Balance',
                size: 16,
                fontFamily: popionsRegular,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: GetText(
                text: '₹5,080',
                size: 34,
                fontFamily: popionsMedium,
                fontWeight: FontWeight.w500,
                color: AppColors.whiteColor),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(MyRouter.pDesposit);
                  },
                  child: Container(
                    height: 47,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xff686868),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                    child: const GetText(
                        text: 'DEPOSIT MONEY',
                        size: 14,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(MyRouter.pDesposit);
                  },
                  child: Container(
                    height: 47,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xffCFCFCF),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20))),
                    child: const GetText(
                        text: 'ADD MONEY',
                        size: 14,
                        fontFamily: popionsMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
