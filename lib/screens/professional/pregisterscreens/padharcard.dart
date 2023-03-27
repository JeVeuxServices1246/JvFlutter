import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/adhar_card_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/custom_textfield.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PAdharCard extends StatefulWidget {
  const PAdharCard({super.key});

  @override
  State<PAdharCard> createState() => _PAdharCardState();
}

class _PAdharCardState extends State<PAdharCard> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdharCardController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(true, AppStrings.jeveuxTitle),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            CustomTextField(
                hintText: 'Aadhar number',
                controller: controller.adharCardController),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                imageUI('Front picture'),
                const SizedBox(
                  width: 15,
                ),
                imageUI('Back picture'),
              ],
            ),
            const Spacer(),
            customBtn('Next', Colors.black, Colors.white, () {
              Get.toNamed(MyRouter.pPanCard);
            }),
            const SizedBox(
              height: 30,
            )
          ],
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
