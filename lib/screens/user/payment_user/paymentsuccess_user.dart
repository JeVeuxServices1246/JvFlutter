import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PaymentSuccessUser extends StatefulWidget {
  const PaymentSuccessUser({super.key});

  @override
  State<PaymentSuccessUser> createState() => _PaymentSuccessUserState();
}

class _PaymentSuccessUserState extends State<PaymentSuccessUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/paymentsuccess.png'),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/check_circle.png',
                      width: 111,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    AppStrings.greatTitle,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff5E17EB),
                        fontWeight: FontWeight.w400,
                        fontFamily: popionsRegular),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    AppStrings.paymentSuccessTitle,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff161616),
                        fontWeight: FontWeight.w700,
                        fontFamily: popionsBold),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27, right: 36),
                    child: buildPaymentUI(AppStrings.paymentMode, 'UPI'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27, right: 36),
                    child: buildPaymentUI(AppStrings.totalAmount, '₹749'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27, right: 36),
                    child: buildPaymentUI(AppStrings.payDate, 'Apr 10, 2022'),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27, right: 36),
                    child: buildPaymentUI(AppStrings.payTime, '10:45 am'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      AppStrings.totalPay,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.lightGreyColor,
                          fontFamily: popionsMedium),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    '₹749 ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: popionsBold,
                        color: Color(0xff5E17EB)),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.26, right: 18.26),
            child: customBtn('Done', Colors.black, Colors.white, () {
              Get.toNamed(MyRouter.bookingSuccess);
            }),
          )
        ],
      ),
    );
  }

  Widget buildPaymentUI(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, right: 27),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: popionsMedium,
                color: AppColors.lightGreyColor),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: popionsMedium,
                color: Color(0xff161616)),
          ),
        ],
      ),
    );
  }
}
