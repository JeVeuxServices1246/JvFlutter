import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/subscription_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PSubscription extends StatefulWidget {
  const PSubscription({super.key});

  @override
  State<PSubscription> createState() => _PSubscriptionState();
}

class _PSubscriptionState extends State<PSubscription> {
  final controller = Get.put(SubscriptionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff000000),
        leading: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffffffff)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        title: const PoppinsAddText(
          textAlign: TextAlign.start,
          text: "Subscription",
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              color: const Color(0xff000000),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/starsub.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/starnew.png',
                                width: 12,
                                height: 13,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const PoppinsAddText(
                              textAlign: TextAlign.start,
                              text: "Feature 1 dummy detail here ",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/starnew.png',
                                width: 12,
                                height: 13,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const PoppinsAddText(
                              textAlign: TextAlign.start,
                              text: "Feature 2 dummy detail here ",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/starnew.png',
                                width: 12,
                                height: 13,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const PoppinsAddText(
                              textAlign: TextAlign.start,
                              text: "Feature 3 dummy detail here ",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            subscriptionPlanWidget('1 Year', 'Pay for a full year', '299', 1,
                () {
              controller.changeValue(1);
              setState(() {});
            }),
            const SizedBox(
              height: 16,
            ),
            subscriptionPlanWidget(
                '6 Months', 'pay monthly, cancel anytime', '499', 2, () {
              controller.changeValue(2);
              setState(() {});
            }),
            const SizedBox(
              height: 16,
            ),
            subscriptionPlanWidget(
                '3 Months', 'pay monthly, cancel anytime', '699', 3, () {
              controller.changeValue(3);
              setState(() {});
            }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: customBtn('Make payment', AppColors.blackColor,
                  AppColors.whiteColor, () {}),
            ),
            const SizedBox(
              height: 15,
            ),
            bottomIndicatorWidget()
          ],
        ),
      ),
    );
  }

  Widget subscriptionPlanWidget(String title, String subtitle, String price,
      int index, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 72,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 15, right: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(width: 2, color: AppColors.textBlackColor),
            color: AppColors.subsBackgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 13,
                  margin: const EdgeInsets.only(top: 5),
                  width: 13,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.blackColor)),
                  padding: const EdgeInsets.all(1),
                  child: Obx(
                    () => controller.selected.value == index
                        ? Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blackColor),
                          )
                        : Container(),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GetText(
                    text: title,
                    size: 16,
                    fontFamily: popionsBold,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlackColor),
                const Spacer(),
                Row(
                  children: [
                    const GetText(
                        text: '₹ ',
                        size: 12,
                        fontFamily: popionsRegular,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff5E17EB)),
                    Text.rich(TextSpan(
                        text: price,
                        style: const TextStyle(
                            color: Color(0xff5E17EB),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: popionsBold),
                        children: const [
                          TextSpan(
                              text: '/ m',
                              style: TextStyle(
                                  color: Color(0xff5E17EB),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: popionsRegular))
                        ])),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29),
              child: GetText(
                  text: subtitle,
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

  Widget referAsUI(String img, String title, String des) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.26, right: 18.26),
      child: InkWell(
        onTap: () {
          openReferBottomSheet();
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(20),
          ),
          padding:
              const EdgeInsets.only(top: 8, left: 9.13, bottom: 8, right: 9),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                img,
                height: 70,
                width: 79,
              ),
              const SizedBox(
                width: 18,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff161616),
                          fontWeight: FontWeight.w600,
                          fontFamily: popionsBold),
                    ),
                    Text(
                      des,
                      style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: popionsRegular),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Image.asset(
                  'assets/icon/keyboard_arrow_back.png',
                  height: 30,
                  width: 34,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  openReferBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
                top: 26, left: 18.26, right: 19.24, bottom: 35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                inviteRowColumnUI(
                  'assets/icon/invite1.png',
                  'Invite all friends even if they have tried us. You will get rewarded everytime!',
                ),
                const SizedBox(
                  height: 24,
                ),
                inviteRowColumnUI(
                  'assets/icon/invite2.png',
                  'Upon inviting, we’ll give them rewards for the services they haven’t tried yet',
                ),
                const SizedBox(
                  height: 24,
                ),
                inviteRowColumnUI(
                  'assets/icon/invite3.png',
                  'For every successful signup, you can win upto ₹500, and minimum ₹100',
                ),
              ],
            ),
          );
        });
  }

  Widget inviteRowColumnUI(String img, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 5, color: const Color(0xffF3F3F3))),
          child: Image.asset(
            img,
            width: 26,
            height: 26,
          ),
        ),
        const SizedBox(
          width: 23,
        ),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
                color: Color(0xff161616),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: popionsRegular),
          ),
        )
      ],
    );
  }
}
