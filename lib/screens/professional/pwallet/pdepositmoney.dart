import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PDepositMoney extends StatefulWidget {
  const PDepositMoney({super.key});

  @override
  State<PDepositMoney> createState() => _PDepositMoneyState();
}

class _PDepositMoneyState extends State<PDepositMoney> {
  TextEditingController amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  String val = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(true, 'Enter Amount'),
      body: Column(
        children: [
          const Spacer(),
          amountTextField(),
          const Text.rich(TextSpan(
              text: 'Current Balance ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor,
                  fontFamily: popionsMedium),
              children: [
                TextSpan(
                    text: '₹3600',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textBlackColor,
                        fontFamily: popionsMedium))
              ])),
          const Spacer(),
          SizedBox(
            height: 32,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, idex) {
                  return defaultAmountWidget('+ ₹100');
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: customBtn(
                'Continue',
                val.isEmpty ? AppColors.greyF3Color : AppColors.blackColor,
                val.isEmpty ? AppColors.hintColor : AppColors.whiteColor, () {
              successDialog();
            }),
          ),
        ],
      ),
    );
  }

  amountTextField() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        child: TextFormField(
          controller: amountController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textAlign: TextAlign.center,
          onChanged: (val) {
            this.val = val.toString();
            setState(() {});
          },
          showCursor: false,
          style: const TextStyle(
              fontSize: 34,
              fontFamily: popionsBold,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor),
          decoration: const InputDecoration(
              hintText: '₹0',
              hintStyle: TextStyle(
                  fontSize: 34,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w600,
                  color: AppColors.hintColor),
              border: InputBorder.none),
        ),
      ),
    );
  }

  defaultAmountWidget(String amount) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 16, bottom: 4, right: 17),
      decoration: BoxDecoration(
          color: AppColors.greyF3Color,
          borderRadius: BorderRadius.circular(30)),
      child: GetText(
          text: amount,
          size: 14,
          fontFamily: popionsMedium,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGreyColor),
    );
  }

  successDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/check_circle.png',
                  width: 111,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const GetText(
                    text: 'Payment added successfully!',
                    size: 14,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlackColor),
                const SizedBox(
                  height: 20,
                ),
                customBtn(
                    'Done', AppColors.blackColor, AppColors.whiteColor, () {})
              ],
            ),
          );
        });
  }
}
