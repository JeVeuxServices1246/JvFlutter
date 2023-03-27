import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/controllers/view_service_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';

class ViewServiceUser extends StatefulWidget {
  const ViewServiceUser({super.key});

  @override
  State<ViewServiceUser> createState() => _ViewServiceUserState();
}

class _ViewServiceUserState extends State<ViewServiceUser> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewServiceControllr());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTabBar(controller),
            const SizedBox(
              height: 16,
            ),
            userProfile(),
            const SizedBox(
              height: 24,
            ),
            serviceUI(),
            const SizedBox(
              height: 29,
            ),
            newAddedServiceUI(),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  serviceUI() {
    return Container(
      margin: const EdgeInsets.only(left: 18.26, right: 18.26),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffF3F3F3)),
        borderRadius: BorderRadius.circular(20),
      ),
      padding:
          const EdgeInsets.only(top: 16, left: 18.27, right: 4, bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/acservice1.png',
              height: 100,
              width: 114,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 18.27,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'AC Service',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff161616),
                      fontFamily: popionsBold,
                      fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Container(
                      height: 4,
                      width: 4.57,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(
                      width: 9.17,
                    ),
                    const Text(
                      '1 hr',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGreyColor,
                          fontFamily: popionsRegular),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 4,
                      width: 4.57,
                      decoration: BoxDecoration(
                          color: AppColors.lightGreyColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(
                      width: 9.17,
                    ),
                    const Flexible(
                      child: Text(
                        'Includes dummy info',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGreyColor,
                            fontFamily: popionsRegular),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  newAddedServiceUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.26, right: 18.26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Added Services',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: popionsBold,
                color: Color(0xff161616)),
          ),
          ListView.separated(
              separatorBuilder: (context, i) {
                return const SizedBox(
                  height: 16,
                );
              },
              physics: const ScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffF3F3F3)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(
                      top: 16, left: 18.27, right: 4, bottom: 16),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/acservice1.png',
                          height: 100,
                          width: 114,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 18.27,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'AC Service',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff161616),
                                      fontFamily: popionsBold,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  '₹299',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff5E17EB),
                                      fontFamily: popionsBold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 4,
                                  width: 4.57,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightGreyColor,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                const SizedBox(
                                  width: 9.17,
                                ),
                                const Text(
                                  '1 hr',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightGreyColor,
                                      fontFamily: popionsRegular),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 4,
                                  width: 4.57,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightGreyColor,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                const SizedBox(
                                  width: 9.17,
                                ),
                                const Flexible(
                                  child: Text(
                                    'Includes dummy info',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.lightGreyColor,
                                        fontFamily: popionsRegular),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

  userProfile() {
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.servicecompleted);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 18.26, right: 18.26),
        child: Row(
          children: [
            Image.asset(
              'assets/images/jimi.png',
              width: 79.89,
              height: 70,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 17.85,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jim Carrey',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff161616),
                      fontWeight: FontWeight.w700,
                      fontFamily: popionsBold),
                ),
                const Text(
                  'Electrician',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff161616),
                      fontWeight: FontWeight.w400,
                      fontFamily: popionsRegular),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon/star.png',
                      width: 10,
                      height: 10,
                    ),
                    const SizedBox(
                      width: 7.39,
                    ),
                    Text(
                      '4.8 (27)',
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: popionsMedium),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 70,
              width: 79.80,
              decoration: BoxDecoration(
                  color: Color(0xffF2EBFF),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'OTP',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff161616),
                        fontFamily: popionsBold),
                  ),
                  Text(
                    '4567',
                    style: TextStyle(
                        color: Color(0xff5E17EB),
                        fontSize: 16,
                        fontFamily: popionsBold,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildTabBar(ViewServiceControllr controller) {
    return Container(
      color: const Color(0xff5E17EB),
      padding: const EdgeInsets.only(top: 55),
      child: Column(
        children: [
          customTabBar(controller),
          const SizedBox(
            height: 27,
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: const Color(0xff5E17EB),
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 40,
                      color: Color(0xff8C52FF))
                ]),
            alignment: Alignment.center,
            child: const Text(
              '12:54',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: popionsBold,
                  color: Colors.white),
            ),
          ),
          Stack(
            children: [
              Image.asset('assets/images/back_design.png'),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildTrack(
                              const Color(0xffF5C443), 'Agent \narrived', 0),
                          Container(
                            height: 1,
                            width: 90,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xffF5C443),
                              Color(0xff2B95E9)
                            ])),
                          ),
                          buildTrack(Color(0xff2B95E9), 'Service\nstarted', 0),
                          Container(
                            height: 1,
                            width: 90,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xff52B46B),
                              Color(0xff2B95E9)
                            ])),
                          ),
                          buildTrack(
                              const Color(0xff52B46B), 'Service\ncompleted', 0),
                        ],
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Agent\narrived',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: popionsMedium),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Service \nstarted',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: popionsMedium),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Service\ncompleted',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: popionsMedium),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildTrack(Color color, String title, int index) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 10,
      ),
    );
  }

  customTabBar(ViewServiceControllr controller) {
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
    ViewServiceControllr controller,
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
                Obx(
                  () => PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: text,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: controller.selectTabBar == select
                        ? FontWeight.w500
                        : FontWeight.w400,
                    color: controller.selectTabBar == select
                        ? Colors.white
                        : const Color(0xffE3E3E3),
                  ),
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
                              color: Colors.white,
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
}
