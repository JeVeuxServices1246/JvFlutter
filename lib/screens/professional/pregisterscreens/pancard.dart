import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/pan_card_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/custom_textfield.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PanCard extends StatefulWidget {
  const PanCard({super.key});

  @override
  State<PanCard> createState() => _PanCardState();
}

class _PanCardState extends State<PanCard> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PanCardController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(true, AppStrings.jeveuxTitle),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: CustomTextField(
                  hintText: 'PAN', controller: controller.panCardController),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  imageUI('Front picture'),
                  const SizedBox(
                    width: 15,
                  ),
                  imageUI('Back picture'),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  checkBox(controller.selectCheckBox, () {
                    if (controller.selectCheckBox != true) {
                      controller.selectCheckBox = true;
                    } else {
                      controller.selectCheckBox = false;
                    }
                    setState(() {});
                  }),
                  const SizedBox(
                    width: 8,
                  ),
                  const Flexible(
                    child: GetText(
                        text: AppStrings.panTermsCondition,
                        size: 13,
                        fontFamily: popionsRegular,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBlackColor),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: customBtn('Submit', Colors.black, Colors.white, () {
                Future.delayed(const Duration(seconds: 1), () {
                  Get.toNamed(MyRouter.pDashboard);
                });
                dialogBox();
              }),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  dialogBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/popup_background_design.png',
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, right: 16),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffEBEBEB)),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.lightGreyColor,
                                size: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.67,
                        ),
                        Image.asset(
                          'assets/icon/partying_face.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 37, right: 34),
                          child: GetText(
                              text:
                                  'Hurray ! You got 1 month Plus membership worth ₹999 for free. Enjoy the plus features and earn more everyday.',
                              size: 14,
                              fontFamily: popionsBold,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textBlackColor),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  checkBox(bool color, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
            color: color ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black)),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 10,
        ),
      ),
    );
  }

  Widget imageUI(String title) {
    return Flexible(
      child: SizedBox(
        height: 164,
        width: double.infinity,
        child: DottedBorder(
            dashPattern: [8, 4],
            color: const Color(0xff79747E),
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            padding: const EdgeInsets.all(6),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: const Color(0xffA0A0A0),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetText(
                      text: title,
                      size: 14,
                      fontFamily: popionsRegular,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffA0A0A0))
                ],
              ),
            )),
      ),
    );
  }
}
