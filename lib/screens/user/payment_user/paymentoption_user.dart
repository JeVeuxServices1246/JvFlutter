import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/payment_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PaymentOptionUser extends StatefulWidget {
  const PaymentOptionUser({super.key});

  @override
  State<PaymentOptionUser> createState() => _PaymentOptionUserState();
}

class _PaymentOptionUserState extends State<PaymentOptionUser> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const PoppinsAddText(
          textAlign: TextAlign.start,
          text: AppStrings.paymentOptionTitle,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26, right: 23, top: 40),
        child: Column(
          children: [
            buildPaymentOptionUI(
              controller,
              () {
                setState(() {
                  controller.radioValue.value = 0;
                });
              },
              0,
              'assets/icon/debit.png',
              AppStrings.debitTitle,
            ),
            const SizedBox(
              height: 27,
            ),
            buildPaymentOptionUI(
              controller,
              () {
                setState(() {
                  controller.radioValue.value = 1;
                });
              },
              1,
              'assets/icon/upi.png',
              AppStrings.upiTitle,
            ),
            const SizedBox(
              height: 27,
            ),
            buildPaymentOptionUI(
              controller,
              () {
                setState(() {
                  controller.radioValue.value = 2;
                });
              },
              2,
              'assets/icon/netbanking.png',
              AppStrings.netBankingTitle,
            ),
            const SizedBox(
              height: 27,
            ),
            buildPaymentOptionUI(
              controller,
              () {
                setState(() {
                  controller.radioValue.value = 3;
                });
              },
              3,
              'assets/icon/cash.png',
              AppStrings.cashTitle,
            ),
            const SizedBox(
              height: 7,
            ),
            Image.asset('assets/icon/paymentmsg.png'),
            const Spacer(),
            customBtn(
                'Proceed',
                controller.radioValue == 10
                    ? const Color(0xffD8D8D8)
                    : Colors.black,
                controller.radioValue == 10
                    ? const Color(0xff858585)
                    : Colors.white, () {
              if (controller.radioValue == 10) {
                EasyLoading.showToast('Select your payment option');
              } else {
                Get.toNamed(MyRouter.paymentSuccess);
              }
            })
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOptionUI(PaymentController controller, Function() onTap,
      int index, String img, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          radioBtn(controller, index),
          const SizedBox(
            width: 21,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff161616),
                fontFamily: popionsMedium),
          ),
          const Spacer(),
          Image.asset(
            img,
            width: 32,
            height: 32,
          )
        ],
      ),
    );
  }

  radioBtn(PaymentController controller, int index) {
    return Container(
      height: 16,
      width: 16,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xff161616), width: 1)),
      child: controller.radioValue.value == index
          ? Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff161616)),
            )
          : Container(),
    );
  }
}
