import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/pbottombar_controller.dart';
import 'package:jv_app/screens/professional/pbottombar/pbookings/pbooking.dart';
import 'package:jv_app/screens/professional/pbottombar/pdashboard/pdashboard.dart';
import 'package:jv_app/screens/professional/pbottombar/phome/phome.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';

class PBottomBar extends StatefulWidget {
  const PBottomBar({super.key});

  @override
  State<PBottomBar> createState() => _PBottomBarState();
}

class _PBottomBarState extends State<PBottomBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final controller = Get.put(PBottombarController());

  List screens = [
    const PHome(),
    const PBooking(),
    // const PWallet(),
    const PDashboard()
  ];

  @override
  Widget build(BuildContext context) {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double slide = rightSlide * _animationController.value;
        double scale = 1 - (_animationController.value * 0.26);
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 52,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 24),
                          child: IconButton(
                            onPressed: () => _toggleAnimation(),
                            icon: AnimatedIcon(
                              icon: AnimatedIcons.menu_close,
                              color: Colors.white,
                              progress: _animationController,
                            ),
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      userProfileUI(),
                      const SizedBox(
                        height: 49,
                      ),
                      Container(
                        height: 1,
                        color: const Color(0xffBFA2F7),
                      ),
                      optionSideBar(),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    _animationController.isDismissed ? 0 : 20),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    leading: Obx(
                      () => controller.currentTab.value == 0
                          ? GestureDetector(
                              onTap: () {
                                _toggleAnimation();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 8, left: 16, bottom: 8),
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffF3F3F3)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/icon/menu.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            )
                          : Container(),
                    ),
                    actions: [
                      Obx(
                        () => controller.currentTab.value == 0
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(MyRouter.pNotification);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 8, right: 16, bottom: 8),
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xffF3F3F3)),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/icon/notification.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                    centerTitle: true,
                    title: Obx(
                      () => controller.currentTab.value == 0
                          ? Column(
                              children: [
                                const GetText(
                                    text: AppStrings.locationTitle,
                                    size: 12,
                                    fontFamily: popionsRegular,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGreyColor),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icon/Location.png',
                                      width: 10,
                                      height: 12.75,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text(
                                      'Ayodhya Nagar, Bhopal',
                                      maxLines: 1,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 14,
                                          fontFamily: popionsBold,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textBlackColor),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Container(),
                    ),
                  ),
                  body: Obx(() => screens[controller.currentTab.value]),
                  bottomNavigationBar: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    width: 1,
                                    color: AppColors.textfieldColor))),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => customBottomNavigationBar(
                                    controller.currentTab.value == 0
                                        ? 'assets/icon/phomeicon.png'
                                        : 'assets/icon/phomegreyicon.png',
                                    'Home',
                                    controller.currentTab.value == 0
                                        ? AppColors.blackColor
                                        : const Color(0xffB4B4B4),
                                    0, () {
                                  controller.changeTabValue(0);
                                })),
                            Obx(() => customBottomNavigationBar(
                                    controller.currentTab.value == 1
                                        ? 'assets/icon/pbookingblackicon.png'
                                        : 'assets/icon/pbookingicon.png',
                                    'Bookings',
                                    controller.currentTab.value == 1
                                        ? AppColors.blackColor
                                        : const Color(0xffB4B4B4),
                                    1, () {
                                  controller.changeTabValue(1);
                                })),
                            // Obx(() => customBottomNavigationBar(
                            //         controller.currentTab.value == 2
                            //             ? 'assets/icon/pwalletblackicon.png'
                            //             : 'assets/icon/pwalleticon.png',
                            //         'Wallet',
                            //         controller.currentTab.value == 2
                            //             ? AppTheme.blackColor
                            //             : const Color(0xffB4B4B4),
                            //         2, () {
                            //       controller.changeTabValue(2);
                            //     })),
                            Obx(() => customBottomNavigationBar(
                                    controller.currentTab.value == 2
                                        ? 'assets/icon/pdashboardblackicon.png'
                                        : 'assets/icon/pdashboardicon.png',
                                    'Dashboard',
                                    controller.currentTab.value == 2
                                        ? AppColors.blackColor
                                        : const Color(0xffB4B4B4),
                                    3, () {
                                  controller.changeTabValue(2);
                                })),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      bottomIndicatorWidget()
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  customBottomNavigationBar(
      String img, String title, Color textColor, int index, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              img,
              height: 24,
              width: 23.94,
            ),
            const SizedBox(
              height: 4,
            ),
            GetText(
                text: title,
                size: 12,
                fontFamily: popionsRegular,
                fontWeight: FontWeight.w400,
                color: textColor)
          ],
        ),
      ),
    );
  }

  optionSideBar() {
    return Container(
      padding: const EdgeInsets.only(left: 24, top: 32),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            //Get.toNamed(MyRouter.pEditProfile);
            Get.toNamed(MyRouter.pSubscription);
          },
          child: optionUI('assets/icon/subscription.png', 'Subscription'),
        ),
        const SizedBox(
          height: 32,
        ),
        optionUI('assets/icon/rate_card.png', 'Rate Card'),
        const SizedBox(
          height: 32,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(MyRouter.pBankDetail);
          },
          child: optionUI('assets/icon/bank.png', 'Bank Details'),
        ),
        const SizedBox(
          height: 32,
        ),
        GestureDetector(
          onTap: () {
            //Get.toNamed(MyRouter.pEditProfile);
            Get.toNamed(MyRouter.pReferEarn);
          },
          child: optionUI('assets/icon/share.png', 'Refer & Earn'),
        ),
        const SizedBox(
          height: 32,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(MyRouter.pRateUs);
          },
          child: optionUI('assets/icon/star_white.png', 'Rate us'),
        ),
        const SizedBox(
          height: 32,
        ),
        optionUI('assets/icon/about_jeveux.png', 'About JEveux'),
        const SizedBox(
          height: 32,
        ),
        optionUI('assets/icon/logout.png', 'Logout'),
      ]),
    );
  }

  userProfileUI() {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/profile.png',
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 16,
          ),
          const GetText(
              text: 'Ana Steven',
              size: 16,
              fontFamily: popionsMedium,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              const GetText(
                  text: '+91 6245675678',
                  size: 12,
                  fontFamily: popionsRegular,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              const SizedBox(
                width: 62,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(MyRouter.pEditProfile);
                },
                child: Image.asset(
                  'assets/icon/edit.png',
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              if (controller.isOnline.value == false) {
                controller.changeValue(true);
              } else {
                Get.toNamed(MyRouter.pOffline)?.then((value) {
                  controller.changeValue(false);
                  setState(() {});
                });
              }
            },
            child: Obx(
              () => Container(
                height: 25,
                width: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: controller.isOnline.value == true
                        ? const Color(0xff52B46B)
                        : AppColors.lightGreyColor),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    controller.isOnline.value == false
                        ? Container(
                            height: 17,
                            width: 17,
                            decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: Container(
                              height: 2,
                              width: 9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.lightGreyColor),
                            ),
                          )
                        : Container(),
                    GetText(
                        text: controller.isOnline.value == true
                            ? 'Online'
                            : 'Offline',
                        size: 14,
                        fontFamily: popionsRegular,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    controller.isOnline.value == true
                        ? Container(
                            height: 17,
                            width: 17,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            child: Container(
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 1.5, color: Color(0xff52B46B))),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  optionUI(String img, String title) {
    return Row(
      children: [
        Image.asset(
          img,
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 16,
        ),
        GetText(
            text: title,
            size: 14,
            fontFamily: popionsMedium,
            fontWeight: FontWeight.w500,
            color: Colors.white)
      ],
    );
  }
}
