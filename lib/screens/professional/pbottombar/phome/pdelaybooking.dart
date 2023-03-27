import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/p_delaybooking_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/professional/widget/pcustomproduct_widget.dart';
import 'package:jv_app/screens/user/widgets/appBar.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PDelayBooking extends StatefulWidget {
  const PDelayBooking({super.key});

  @override
  State<PDelayBooking> createState() => _PDelayBookingState();
}

class _PDelayBookingState extends State<PDelayBooking> {
  List timerList = ['15 mins', '20 mins', '30 mins'];
  final controller = Get.put(PDelayBookingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: appBar(true, 'Delay Booking'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: AppColors.greyF3Color,
              child: const GetText(
                  text: 'DELAY BY',
                  size: 12,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lightGreyColor),
            ),
            const SizedBox(
              height: 16,
            ),
            timerWidget(),
            const SizedBox(
              height: 48,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: AppColors.greyF3Color,
              child: const GetText(
                  text: 'REASON FOR DELAY',
                  size: 12,
                  fontFamily: popionsBold,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lightGreyColor),
            ),
            const SizedBox(
              height: 16,
            ),
            reasonDelayWidget('A reason here for delay of booking', 1, () {
              controller.changedRadioValue(1);
            }),
            const SizedBox(
              height: 12,
            ),
            reasonDelayWidget(
                'A reason here for delay of booking, a reason here for delay of booking  ',
                2, () {
              controller.changedRadioValue(2);
            }),
            const SizedBox(
              height: 16,
            ),
            commentBox(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => customBtn(
                  'Submit',
                  controller.selectedRadio.value != 0
                      ? AppColors.blackColor
                      : Color(0xffD8D8D8),
                  AppColors.whiteColor, () {
                bookingDelayBottomSheet();
              }),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          bottomIndicatorWidget()
        ],
      ),
    );
  }

  reasonDelayWidget(String title, int index, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 14),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            radioValue(index),
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

  radioValue(int index) {
    return Obx(
      () => Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: controller.selectedRadio.value == index
                    ? AppColors.blackColor
                    : AppColors.lightGreyColor)),
        padding: const EdgeInsets.all(2),
        child: Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.selectedRadio.value == index
                  ? AppColors.blackColor
                  : AppColors.whiteColor),
        ),
      ),
    );
  }

  commentBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.greyF3Color,
      ),
      padding: const EdgeInsets.only(left: 16, right: 14),
      child: TextFormField(
        maxLines: 10,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'or comment here. . .',
            hintStyle: TextStyle(
              color: Color(0xffABABAB),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: popionsRegular,
            )),
      ),
    );
  }

  timerWidget() {
    return SizedBox(
      height: 47,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: (context, i) {
            return const SizedBox(
              width: 14,
            );
          },
          physics: const BouncingScrollPhysics(),
          itemCount: timerList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.changeValue(index);
              },
              child: Obx(
                () => Container(
                  height: 47,
                  width: 105,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: controller.selectedTime.value == index
                          ? const Color(0xffF2ECFD)
                          : AppColors.whiteColor,
                      border: Border.all(
                        color: controller.selectedTime.value == index
                            ? const Color(0xff5E17EB)
                            : const Color(0xffE3E3E3),
                      )),
                  alignment: Alignment.center,
                  child: GetText(
                      text: timerList[index],
                      size: 14,
                      fontFamily: popionsRegular,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textBlackColor),
                ),
              ),
            );
          }),
    );
  }

  bookingDelayBottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 6,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffABABAB)),
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Booking will be delayed\nby 20 mins',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textBlackColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: popionsBold),
                    )),
                const GetText(
                    text: 'You can delay a service only once',
                    size: 16,
                    fontFamily: popionsRegular,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textBlackColor),
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PCustomProductWidget('Diamond Facial'),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PCustomProductWidget('Cleanup'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: customBtn('Delay now', const Color(0xffEA3356),
                      AppColors.whiteColor, () {}),
                ),
                const SizedBox(
                  height: 15,
                ),
                bottomIndicatorWidget()
              ],
            ),
          );
        });
  }
}
