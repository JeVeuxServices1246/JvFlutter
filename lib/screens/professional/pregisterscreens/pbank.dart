import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/bank_details_controller.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/custom_textfield.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PBank extends StatefulWidget {
  const PBank({super.key});

  @override
  State<PBank> createState() => _PBankState();
}

class _PBankState extends State<PBank> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BankDetialsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(false, AppStrings.jeveuxTitle),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Stack(
          children: [
            Column(
              children: [
                CustomTextField(
                    hintText: 'Bank Name *',
                    controller: controller.bankNameController),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    hintText: "Account Number *",
                    controller: controller.accountNumberController),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    hintText: 'Re-enter Account Number *',
                    controller: controller.reEnterAccountController),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    hintText: 'IFSC *', controller: controller.ifscController)
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 23),
                  child: customBtn('Next', Colors.black, Colors.white, () {
                    Get.toNamed(MyRouter.pAdharCard);
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
