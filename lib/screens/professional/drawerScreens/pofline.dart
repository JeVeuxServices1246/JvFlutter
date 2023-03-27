import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/p_offline_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class POffline extends StatefulWidget {
  const POffline({super.key});

  @override
  State<POffline> createState() => _POfflineState();
}

class _POfflineState extends State<POffline> {
  final controller = Get.put(POfflineController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(true, 'Go Offline'),
      body: Column(
        children: [
          Container(
            color: AppColors.greyF3Color,
            width: double.infinity,
            height: 46,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: const GetText(
                text: 'reason for getting offline',
                size: 12,
                fontFamily: popionsBold,
                fontWeight: FontWeight.w700,
                color: AppColors.lightGreyColor),
          ),
          const SizedBox(
            height: 16,
          ),
          reasonWidget('A reason here for getting offline', 1, () {
            controller.changeValue(1);
          }),
          const SizedBox(
            height: 8,
          ),
          reasonWidget(
              'A reason here for getting offline, a reason here for getting offline',
              2, () {
            controller.changeValue(2);
          }),
          const SizedBox(
            height: 16,
          ),
          commentBox()
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: customBtn(
                'Submit', AppColors.blackColor, AppColors.whiteColor, () {}),
          ),
          const SizedBox(
            height: 10,
          ),
          bottomIndicatorWidget()
        ],
      ),
    );
  }

  reasonWidget(String title, int index, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 11),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.blackColor)),
              padding: const EdgeInsets.all(2),
              child: Obx(
                () => controller.selected.value == index
                    ? Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                            color: AppColors.blackColor,
                            shape: BoxShape.circle),
                      )
                    : Container(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: GetText(
                  text: title,
                  size: 14,
                  fontFamily: popionsRegular,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlackColor),
            )
          ],
        ),
      ),
    );
  }

  commentBox() {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.greyF3Color),
      child: TextFormField(
        maxLines: 10,
        decoration: const InputDecoration(
            hintText: 'or comment your reason here. . .',
            hintStyle: TextStyle(
                color: AppColors.hintColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: popionsRegular),
            border: InputBorder.none),
      ),
    );
  }
}
