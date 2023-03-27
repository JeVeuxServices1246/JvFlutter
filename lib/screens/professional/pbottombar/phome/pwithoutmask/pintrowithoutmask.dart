import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PIntroWithoutMask extends StatefulWidget {
  const PIntroWithoutMask({super.key});

  @override
  State<PIntroWithoutMask> createState() => _PIntroWithoutMaskState();
}

class _PIntroWithoutMaskState extends State<PIntroWithoutMask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5C443),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.all(6),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF3F3F3)),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/icon/keyboard_arrowback.png',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const GetText(
                text: 'Add a picture without mask',
                size: 24,
                fontFamily: popionsMedium,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor),
            const GetText(
                text: 'A picture is shown below for your reference',
                size: 14,
                fontFamily: popionsRegular,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlackColor),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/images/withoutmaskimg.png',
              width: 220,
              height: 262,
            ),
            const Spacer(),
            customBtn('Proceed', AppColors.blackColor, AppColors.whiteColor, () {
              Get.toNamed(MyRouter.pAddWithoutMaskPicture);
            }),
            const SizedBox(
              height: 15,
            ),
            bottomIndicatorWidget()
          ],
        ),
      ),
    );
  }
}
