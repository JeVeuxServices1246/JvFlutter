import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/p_leads_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';

class PLeaderBoard extends StatefulWidget {
  const PLeaderBoard({super.key});

  @override
  State<PLeaderBoard> createState() => _PLeaderBoardState();
}

class _PLeaderBoardState extends State<PLeaderBoard> {
  final controller = Get.put(PLeadsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff393939),
      appBar: AppBar(
        backgroundColor: const Color(0xff393939),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 12, bottom: 6, top: 6),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffF3F3F3)),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icon/keyboard_arrowback.png',
              height: 20,
              width: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: const GetText(
            text: 'Leaderboard',
            size: 20,
            fontFamily: popionsBold,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              customTabBar(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 24, bottom: 24),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Image.asset('assets/icon/profile.png'),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  GetText(
                                      text: 'Tom Hardy',
                                      size: 16,
                                      fontFamily: popionsMedium,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textBlackColor),
                                  GetText(
                                      text: '254 p',
                                      size: 14,
                                      fontFamily: popionsRegular,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightGreyColor),
                                ],
                              ),
                              const Spacer(),
                              const GetText(
                                  text: '4th',
                                  size: 15,
                                  fontFamily: popionsBold,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff5E17EB)),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Color(0xffEBEBEB),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    })),
          )
        ],
      ),
    );
  }

  customTabBar() {
    return Container(
      height: 49,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xff838383),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tabbarUI('today', 0, () {
            controller.changeTabValue(0);
          }),
          tabbarUI('this week', 1, () {
            controller.changeTabValue(1);
          }),
          tabbarUI('this month', 2, () {
            controller.changeTabValue(2);
          }),
        ],
      ),
    );
  }

  tabbarUI(String title, int index, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: controller.currentTab.value == index
                ? AppColors.whiteColor
                : const Color(0xff838383),
            borderRadius: BorderRadius.circular(25),
          ),
          height: 33,
          width: 102,
          alignment: Alignment.center,
          child: GetText(
              text: title,
              size: 14,
              fontFamily: popionsMedium,
              fontWeight: FontWeight.w500,
              color: controller.currentTab.value == index
                  ? AppColors.textBlackColor
                  : AppColors.whiteColor),
        ),
      ),
    );
  }
}
