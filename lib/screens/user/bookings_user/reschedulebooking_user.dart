import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/reschedule_booking_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class RescheduleBookingUser extends StatefulWidget {
  const RescheduleBookingUser({super.key});

  @override
  State<RescheduleBookingUser> createState() => _RescheduleBookingUserState();
}

class _RescheduleBookingUserState extends State<RescheduleBookingUser> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RescheduleBookingController());
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
          text: AppStrings.rescheduleBookingTitle,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.26, right: 18.26),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bookingDetails('assets/images/bookingimg1.png', 'Diamond Facial',
                  '2 hrs', 'Includes dummy info'),
              const SizedBox(
                height: 16,
              ),
              bookingDetails('assets/images/bookingimg2.png', 'Cleanup',
                  '30 mins', 'Includes dummy info'),
              const SizedBox(
                height: 32,
              ),
              const Text(
                AppStrings.selectDateTime,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: popionsMedium,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff161616)),
              ),
              const Text(
                "Your service will take approx. 45 mins",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.lightGreyColor,
                    fontFamily: popionsRegular),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildSelectDateUI('Sat', '09', 0, () {
                    controller.changeValue(0);
                  }, controller),
                  const SizedBox(
                    width: 17.12,
                  ),
                  buildSelectDateUI('Sun', '10', 1, () {
                    controller.changeValue(1);
                  }, controller),
                  const SizedBox(
                    width: 17.12,
                  ),
                  buildSelectDateUI('Mon', '11', 2, () {
                    controller.changeValue(2);
                  }, controller),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEBEBEB),
                ),
                padding: const EdgeInsets.only(
                    left: 18, top: 8, bottom: 8, right: 18),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon/ic_icon.png',
                      height: 20,
                      width: 22.83,
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    const Flexible(
                      child: Text(
                        AppStrings.freeCancellationDes,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGreyColor,
                            fontFamily: popionsRegular),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildTimeUI('06:30 PM'),
                  const SizedBox(
                    width: 15,
                  ),
                  buildTimeUI('07:30 PM'),
                  const SizedBox(
                    width: 15,
                  ),
                  buildTimeUI('08:30 PM'),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              customBtn(AppStrings.confirmNewSlot, AppColors.buttonBlackColor,
                  Colors.white, () {}),
              const SizedBox(
                height: 31,
              )
            ],
          ),
        ),
      ),
    );
  }

  buildTimeUI(String title) {
    return Flexible(
      child: Container(
        height: 47,
        // width: 119.84,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xffE3E3E3))),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff161616),
              fontFamily: popionsRegular),
        ),
      ),
    );
  }

  buildSelectDateUI(String day, String date, int index, Function() onTap,
      RescheduleBookingController controller) {
    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          height: 58,
          width: 63.91,
          decoration: BoxDecoration(
              color: controller.selected == index
                  ? Color(0xffF2ECFD)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: controller.selected == index
                      ? Color(0xff5E17EB)
                      : const Color(0xffE3E3E3))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGreyColor,
                    fontFamily: popionsRegular,
                    fontSize: 14),
              ),
              Text(
                date,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff161616),
                    fontFamily: popionsBold,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bookingDetails(String img, String title, String des1, String des2) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: const Color(0xffF3F3F3))),
      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  img,
                  height: 100,
                  width: 114,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: title,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        buildDot(),
                        const SizedBox(
                          width: 9.13,
                        ),
                        Flexible(
                          child: PoppinsAddText(
                            textAlign: TextAlign.start,
                            text: des1,
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildDot(),
                        const SizedBox(
                          width: 9.13,
                        ),
                        Flexible(
                          child: PoppinsAddText(
                            textAlign: TextAlign.start,
                            text: des2,
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
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
