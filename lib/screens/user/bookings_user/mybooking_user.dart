import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/booking_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class MyBookingUser extends StatefulWidget {
  const MyBookingUser({super.key});

  @override
  State<MyBookingUser> createState() => _MyBookingUserState();
}

class _MyBookingUserState extends State<MyBookingUser> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
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
          text: AppStrings.bookingTitle,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          customTabBar(controller),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => controller.selectTabBar == 0
                ? Expanded(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.only(left: 18.26, right: 18.26),
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return upcomingBookingUI();
                        }),
                  )
                : Expanded(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.only(left: 18.26, right: 18.26),
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return previousBookingUI();
                        }),
                  ),
          )
        ],
      ),
    );
  }

  customTabBar(BookingController controller) {
    return SizedBox(
      height: 40,
      child: Column(
        children: [
          Row(
            children: [
              tabBarColumnWidget(AppStrings.upcomingTitle, () {
                controller.changeValue(0);
              }, 0, controller),
              tabBarColumnWidget(AppStrings.previousTitle, () {
                controller.changeValue(1);
              }, 1, controller),
              tabBarColumnWidget(AppStrings.ongoingTitle, () {
                controller.changeValue(2);
              }, 2, controller),
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xffEBEBEB),
          )
        ],
      ),
    );
  }

  tabBarColumnWidget(
    String text,
    Function() onTap,
    int select,
    BookingController controller,
  ) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 33,
            child: Column(
              children: [
                PoppinsAddText(
                  textAlign: TextAlign.start,
                  text: text,
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 4,
                ),
                Obx(
                  () => controller.selectTabBar == select
                      ? Container(
                          height: 4,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget upcomingBookingUI() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.bookingColor,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.only(top: 16, left: 18.26, right: 18.26),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: '10th',
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff161616),
                  ),
                  PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: 'Apr, Sunday',
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ],
              ),
              const Spacer(),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: 'Salon for Women',
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              buildDot(),
              const SizedBox(
                width: 9.13,
              ),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: 'Diamond Facial',
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGreyColor,
              ),
            ],
          ),
          Row(
            children: [
              buildDot(),
              const SizedBox(
                width: 9.13,
              ),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: 'Cleanup',
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGreyColor,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Flexible(
                child: customBtn(AppStrings.reschedule,
                    AppColors.buttonBlackColor, Colors.white, () {
                  Get.toNamed(MyRouter.rescheduleBooking);
                }),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(MyRouter.viewBooking);
                },
                child: const PoppinsAddText(
                  textAlign: TextAlign.start,
                  text: AppStrings.viewDetailsTitle,
                  fontSize: 14,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Widget previousBookingUI() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.bookingColor,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.only(top: 16, left: 18.26, right: 18.26),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: '24th',
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff161616),
                  ),
                  PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: 'May, Friday',
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ],
              ),
              const Spacer(),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: 'AC Service',
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              buildDot(),
              const SizedBox(
                width: 9.13,
              ),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: 'General service',
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGreyColor,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Flexible(
                child: customBtn('Share Feedback', AppColors.buttonBlackColor,
                    Colors.white, () {}),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(MyRouter.viewBooking);
                },
                child: const PoppinsAddText(
                  textAlign: TextAlign.start,
                  text: AppStrings.viewDetailsTitle,
                  fontSize: 14,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Widget buildDot() {
    return Container(
      height: 4,
      width: 4.57,
      decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
