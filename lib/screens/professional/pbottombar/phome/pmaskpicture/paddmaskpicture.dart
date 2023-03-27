import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PAddMaskPicture extends StatefulWidget {
  const PAddMaskPicture({super.key});

  @override
  State<PAddMaskPicture> createState() => _PAddMaskPictureState();
}

class _PAddMaskPictureState extends State<PAddMaskPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(true, ''),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Click a picture including your face and upper body ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontFamily: popionsMedium,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlackColor),
          ),
          const GetText(
              text: 'Don’t make any movement while clicking picture',
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor),
          const SizedBox(
            height: 60,
          ),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.greyF3Color),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: customBtn(
                'Click', AppColors.blackColor, AppColors.whiteColor, () {
              Get.toNamed(MyRouter.pIntroWithoutMask);
            }),
          ),
          const SizedBox(
            height: 15,
          ),
          bottomIndicatorWidget()
        ],
      ),
    );
  }
}
