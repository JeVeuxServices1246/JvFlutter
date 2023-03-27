import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PHomeOnGoingService extends StatefulWidget {
  @override
  State<PHomeOnGoingService> createState() => _PHomeOnGoingServiceState();
}

class _PHomeOnGoingServiceState extends State<PHomeOnGoingService> {
  RxInt controlValue = 0.obs;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          serviceBottomSheet();
        },
        child: SizedBox(
          height: 353,
          width: 353,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/facial.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 33,
                      width: 130,
                      margin: const EdgeInsets.only(left: 24),
                      decoration: BoxDecoration(
                          color: const Color(0xff16161680),
                          borderRadius: BorderRadius.circular(16.5)),
                      alignment: Alignment.center,
                      child: const GetText(
                          text: 'Facial for glow',
                          size: 14,
                          fontFamily: popionsMedium,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Container(
                      height: 171,
                      // width: double.infinity,
                      padding: const EdgeInsets.only(left: 24, right: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          gradient: LinearGradient(colors: [
                            Color(0xff00000000),
                            Color(0xff161616)
                          ])),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const GetText(
                                  text: 'Clean up',
                                  size: 18,
                                  fontFamily: popionsMedium,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const GetText(
                                  text: 'Gold Facial',
                                  size: 18,
                                  fontFamily: popionsMedium,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)
                            ],
                          ),
                          Row(
                            children: [
                              const GetText(
                                  text: '45 mins',
                                  size: 14,
                                  fontFamily: popionsRegular,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffE3E3E3)),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: const Color(0xff16161680),
                                    borderRadius: BorderRadius.circular(12)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/icon/timer.png',
                                  height: 18.75,
                                  width: 18.75,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xff16161680),
                                    borderRadius: BorderRadius.circular(12)),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/icon/arrow_up.png',
                                  height: 18.75,
                                  width: 18.75,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  serviceBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 24,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: GetText(
                      text: 'Salon for women',
                      size: 16,
                      fontFamily: popionsMedium,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlackColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildSliderBottomSheet(),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GetText(
                          text: 'Service name',
                          size: 16,
                          fontFamily: popionsBold,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textBlackColor),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icon/star.png',
                            height: 10,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const GetText(
                              text: '4.8 (23k)',
                              size: 12,
                              fontFamily: popionsMedium,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlackColor)
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const GetText(
                          text: '₹499',
                          size: 14,
                          fontFamily: popionsBold,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff5E17EB)),
                      const SizedBox(
                        height: 12,
                      ),
                      serviceFacilities('45 mins'),
                      const SizedBox(
                        height: 4,
                      ),
                      serviceFacilities('For all skin types. Pinacolada mask.'),
                      const SizedBox(
                        height: 4,
                      ),
                      serviceFacilities(
                          '6-step process. Includes 10-min massage'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Flexible(
                        child: customBtn(
                            'Dealy', AppColors.blackColor, AppColors.whiteColor,
                            () {
                          Get.toNamed(MyRouter.pDelayBooking);
                        }),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Flexible(
                        child: customBtn('Start', const Color(0xff52B46B),
                            AppColors.whiteColor, () {
                          Get.toNamed(MyRouter.pIntroMask);
                        }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                bottomIndicatorWidget()
              ],
            ),
          );
        });
  }

  serviceFacilities(String title) {
    return Row(
      children: [
        Container(
          height: 4,
          width: 4,
          decoration: const BoxDecoration(
              color: AppColors.lightGreyColor, shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: GetText(
              text: title,
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor),
        )
      ],
    );
  }

  buildSliderBottomSheet() {
    return Column(
      children: [
        SizedBox(
          height: 166,
          width: double.maxFinite,
          child: CarouselSlider(
            items: List.generate(
                4,
                (index) => GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/facial.png',
                              fit: BoxFit.cover,
                              height: 166,
                              width: double.infinity,
                            )),
                      ),
                    )),
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pauseAutoPlayOnTouch: true,
                viewportFraction: .92,
                onPageChanged: (value, _) {
                  controlValue.value = value;
                }),
          ),
        ),
      ],
    );
  }
}
