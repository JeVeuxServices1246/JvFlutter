import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/p_booking_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/professional/widget/pcancelation_widget.dart';
import 'package:jv_app/screens/professional/widget/pcomplete_widget.dart';

class PBooking extends StatefulWidget {
  const PBooking({super.key});

  @override
  State<PBooking> createState() => _PBookingState();
}

class _PBookingState extends State<PBooking> {
  final controller = Get.put(PBookingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          tabBar(),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => controller.selectTabBar.value == 0
                ? const Expanded(child: PCompleteWidget())
                : const Expanded(child: PCancelationWidget()),
          )
        ],
      ),
    );
  }

  tabBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTabBarUI(0, 'Completed', () {
                controller.changeValue(0);
              }),
              buildTabBarUI(1, 'Cancelled', () {
                controller.changeValue(1);
              }),
            ],
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: const Color(0xffEBEBEB),
        )
      ],
    );
  }

  buildTabBarUI(index, String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => SizedBox(
          height: 38,
          width: MediaQuery.of(context).size.width / 2.5,
          child: Column(
            children: [
              GetText(
                  text: title,
                  size: 16,
                  fontFamily: popionsMedium,
                  fontWeight: controller.selectTabBar.value == index
                      ? FontWeight.w500
                      : FontWeight.w400,
                  color: controller.selectTabBar.value == index
                      ? AppColors.blackColor
                      : const Color(0xffA2A2A2)),
              const SizedBox(
                height: 10,
              ),
              controller.selectTabBar.value == index
                  ? Container(
                      height: 4,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.blackColor),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
