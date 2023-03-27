import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class ViewBookingUser extends StatefulWidget {
  const ViewBookingUser({super.key});

  @override
  State<ViewBookingUser> createState() => _ViewBookingUserState();
}

class _ViewBookingUserState extends State<ViewBookingUser> {
  @override
  Widget build(BuildContext context) {
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
          text: AppStrings.upcomingBootkingTitle,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.26, top: 17, right: 18.26),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: '10th',
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff161616),
                    ),
                    const PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: 'Apr, Sunday',
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    bookingDetails('assets/images/bookingimg1.png',
                        'Diamond Facial', '2 hrs', 'Includes dummy info'),
                    const SizedBox(
                      height: 16,
                    ),
                    bookingDetails('assets/images/bookingimg2.png', 'Cleanup',
                        '30 mins', 'Includes dummy info'),
                    const SizedBox(
                      height: 24,
                    ),
                    biilingDetails(),
                    const SizedBox(
                      height: 24,
                    ),
                    addressDetails(),
                    const SizedBox(
                      height: 46,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: customBtn('Cancel', AppColors.buttonGreyColor,
                              const Color(0xff2C2C2C), () {
                            Get.toNamed(MyRouter.cancelBooking);
                          }),
                        ),
                        const SizedBox(
                          width: 14.42,
                        ),
                        Flexible(
                          child: customBtn(AppStrings.reschedule,
                              AppColors.buttonBlackColor, Colors.white, () {
                            Get.toNamed(
                              MyRouter.rescheduleBooking,
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    )
                  ]),
            ),
            Positioned(
              right: 0 - 20,
              bottom: 0 + 10,
              child: InkWell(
                onTap: () {
                  // Get.toNamed(MyRouter.helpScreen);
                },
                child: Container(
                  height: 100,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.only(right: 40, top: 25),
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white, width: 4),
                              color: const Color(0xff52B46B)),
                          height: 75,
                          width: 75,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(AppAssets.helpAccount),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                const PoppinsAddText(
                                  textAlign: TextAlign.start,
                                  text: AppStrings.help,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  addressDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: const Color(0xffF3F3F3))),
      padding:
          const EdgeInsets.only(left: 21.39, top: 18.72, right: 22, bottom: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icon/home_icon.png',
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 14.24,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: 'Home',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    PoppinsAddText(
                      textAlign: TextAlign.start,
                      text:
                          '89, Bhel Nagar, Piplani, Ayodhya Bypass, Bhopal, Madhya Pradesh 462022, India ',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGreyColor,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon/time_icon.png',
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 14.24,
              ),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: 'Sat, Apr 09 - 07:30 PM',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGreyColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  biilingDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: const Color(0xffF3F3F3))),
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 18.26),
            child: Text(
              AppStrings.billingDetailsTitle,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: popionsBold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          buildBillingRow('Item Total', '₹699', Colors.black, FontWeight.w400,
              FontWeight.w400),
          const SizedBox(
            height: 6,
          ),
          buildBillingRow('Item Discount', '-₹50', const Color(0xff52B46B),
              FontWeight.w400, FontWeight.w400),
          const SizedBox(
            height: 6,
          ),
          buildBillingRow('Convinience Fee', '₹50', Colors.black,
              FontWeight.w400, FontWeight.w400),
          const SizedBox(
            height: 30,
          ),
          buildBillingRow('Grand Total', '₹749', Colors.black, FontWeight.w700,
              FontWeight.w700),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 47,
            decoration: const BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            padding: const EdgeInsets.only(left: 18.26, right: 18.26),
            child: Row(
              children: const [
                Text(
                  'Payment mode',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: popionsRegular),
                ),
                Spacer(),
                Text(
                  'SeekMe Wallet',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: popionsRegular),
                ),
              ],
            ),
          )
        ],
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

  Widget buildBillingRow(String title, String des, Color desColor,
      FontWeight fontWeight1, FontWeight fontWeight2) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.26, right: 18.26),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: fontWeight1,
                color: Colors.black,
                fontFamily: popionsRegular),
          ),
          const Spacer(),
          Text(
            des,
            style: TextStyle(
                fontSize: 14,
                fontWeight: fontWeight2,
                color: desColor,
                fontFamily: popionsRegular),
          ),
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
