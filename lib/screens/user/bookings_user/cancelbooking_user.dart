import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/cancel_booking_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class CancelBookingUser extends StatefulWidget {
  const CancelBookingUser({super.key});

  @override
  State<CancelBookingUser> createState() => _CancelBookingUserState();
}

class _CancelBookingUserState extends State<CancelBookingUser> {
  List cancelLists = [
    "A reason here for cancellation of booking",
    "A reason here for cancellation of booking, a reason here for cancellation of booking  ",
    "A reason here for cancellation of booking",
    "A reason here for cancellation of booking, a reason here for cancellation of booking  ",
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CancelBookingController());
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
          text: AppStrings.cancelBookingTitle,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.12, right: 19.4),
              child: bookingDetails('assets/images/acservice.png', 'AC Service',
                  '1 hrs', 'Includes dummy info'),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 46,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 18),
              color: Color(0xffF3F3F3),
              child: const Text(
                'REASON FOR CANCELLATION',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGreyColor,
                    fontFamily: popionsRegular),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
                padding: const EdgeInsets.only(left: 18, right: 19),
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemCount: cancelLists.length,
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildCancelReasonUI(
                      cancelLists[index], controller, index, () {
                    controller.radioValue.value = index;
                  });
                }),
            const SizedBox(
              height: 16,
            ),
            buildComentBox(),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.12, right: 19),
              child: customBtn(AppStrings.cancelNow, AppColors.buttonGreyColor,
                  const Color(0xff858585), () {
                openConfirmBottomSheet();
              }),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  buildComentBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 17.12, right: 19),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.only(left: 19, right: 17),
        child: TextFormField(
          maxLines: 10,
          decoration: const InputDecoration(
              hintText: 'or comment here. . .',
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffABABAB),
                  fontFamily: popionsRegular),
              border: InputBorder.none),
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

  Widget buildCancelReasonUI(String title, CancelBookingController controller,
      int index, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          radioBtn(controller, index),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff161616),
                  fontWeight: FontWeight.w400,
                  fontFamily: popionsRegular,
                  letterSpacing: .5),
            ),
          )
        ],
      ),
    );
  }

  Widget radioBtn(CancelBookingController controller, int index) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.lightGreyColor)),
      padding: const EdgeInsets.all(2),
      child: Obx(
        () => controller.radioValue == index
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              )
            : Container(),
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

  openConfirmBottomSheet() {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 6,
                  width: 43,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffABABAB)),
                ),
                const SizedBox(
                  height: 24,
                ),
                Image.asset(
                  'assets/images/emoji.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  AppStrings.cancelWarningtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: popionsRegular,
                      color: Color(0xff161616)),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text.rich(TextSpan(
                    text: "You can always ",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: popionsRegular,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff161616)),
                    children: [
                      TextSpan(
                          text: 'reshedule',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: popionsBold,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff161616)),
                          children: [
                            TextSpan(
                              text: ' it.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: popionsRegular,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff161616)),
                            )
                          ]),
                    ])),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.26, right: 18.26),
                  child: Row(
                    children: [
                      Flexible(
                        child: customBtn('Cancel anyway', Color(0xffD9D2D2),
                            Color(0xff2B2B2B), () {
                          Get.back();
                        }),
                      ),
                      const SizedBox(
                        width: 14.84,
                      ),
                      Flexible(
                        child: customBtn('Reschedule',
                            AppColors.buttonBlackColor, Colors.white, () {
                          Get.toNamed(MyRouter.rescheduleBooking);
                        }),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 36,
                )
              ],
            ),
          );
        });
  }
}
