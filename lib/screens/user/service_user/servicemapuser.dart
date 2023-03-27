import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class ServiceMapUser extends StatefulWidget {
  const ServiceMapUser({super.key});

  @override
  State<ServiceMapUser> createState() => _ServiceMapUserState();
}

class _ServiceMapUserState extends State<ServiceMapUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/map.png'),
                      Container(
                        padding: const EdgeInsets.only(left: 23.5, top: 15),
                        child: Image.asset(
                          'assets/icon/arrow_back.png',
                          width: 19.27,
                          height: 18.75,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 21.35, right: 22.17, top: 70),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/jimi.png',
                                height: 60,
                                width: 68.5,
                              ),
                              const SizedBox(
                                width: 19,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Jim Carrey',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff161616),
                                        fontFamily: popionsBold),
                                  ),
                                  const Text(
                                    'Electrician',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff161616),
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
                                        width: 4,
                                      ),
                                      const Text(
                                        '4.8 (27)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.lightGreyColor,
                                            fontFamily: popionsMedium),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/icon/Call.png',
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 16.21,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(MyRouter.chatscreen);
                                },
                                child: Image.asset(
                                  'assets/icon/Message.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 85),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(MyRouter.viewservice);
                              },
                              child: const Text(
                                'view details  >>',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6278E8),
                                    fontFamily: popionsMedium),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () {
                              openBottomSheet();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 85),
                              width: 176,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xff333334),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'AC REPAIR',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontFamily: popionsMedium),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Image.asset(
                                    'assets/icon/star.png',
                                    width: 10,
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    width: 2.33,
                                  ),
                                  const Text(
                                    '4.5 (43k)',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontFamily: popionsMedium),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1,
                            color: const Color(0xffEBEBEB),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: const [
                              Text(
                                'OTP',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff161616),
                                    fontFamily: popionsRegular),
                              ),
                              Spacer(),
                              Text(
                                '4564',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff161616),
                                    fontFamily: popionsBold),
                              )
                            ],
                          ),
                          const Text(
                            'share with service provider \nto start service',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: popionsRegular,
                                color: AppColors.lightGreyColor),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 1,
                            color: const Color(0xffEBEBEB),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffF3F3F3)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                                                  color:
                                                      AppColors.lightGreyColor,
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
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          customBtn(
                              'Cancel', Colors.black, Colors.white, () {}),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 86,
                  margin: const EdgeInsets.only(left: 18, right: 15, top: 300),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Jim is on his way 🤘',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: popionsBold),
                      ),
                      Text(
                        'Arriving in 12 mins',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: popionsRegular),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  openBottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(top: 16, left: 34.24, right: 27),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 6,
                      width: 43,
                      decoration: BoxDecoration(
                          color: const Color(0xffABABAB),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/jimi.png',
                        height: 60,
                        width: 68.48,
                      ),
                      const SizedBox(
                        width: 18.28,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jim Carrey',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff161616),
                                fontFamily: popionsBold),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icon/star.png',
                                width: 10.15,
                                height: 10.15,
                              ),
                              const SizedBox(
                                width: 4.73,
                              ),
                              const Text(
                                '4.8 (27)',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff161616),
                                    fontFamily: popionsMedium),
                              ),
                              const SizedBox(
                                width: 11.73,
                              ),
                              Container(
                                width: 10.99,
                                height: 9.63,
                                color: const Color(0xff52B46B),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                              const SizedBox(
                                width: 4.78,
                              ),
                              const Text(
                                '38 jobs completed',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff161616),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: popionsMedium),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4.78,
                          ),
                          const Text.rich(TextSpan(
                              text: 'member since ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff161616),
                                  fontFamily: popionsMedium),
                              children: [
                                TextSpan(
                                    text: '2021',
                                    style: TextStyle(
                                        color: Color(0xff5E17EB),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        fontFamily: popionsMedium))
                              ]))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Container(
                    height: 2,
                    color: const Color(0xffEBEBEB),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      const Text(
                        'What people say ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff161616),
                            fontFamily: popionsBold),
                      ),
                      const SizedBox(
                        width: 9.17,
                      ),
                      Image.asset(
                        'assets/icon/chat.png',
                        height: 28,
                        width: 31.96,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ListView.separated(
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Joan Perkins',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff161616),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: popionsMedium),
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    updateOnDrag: false,
                                    ignoreGestures: false,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 10,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const Text(
                                    '4.0',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff161616),
                                        fontFamily: popionsMedium),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '1 day ago',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.lightGreyColor,
                                        fontFamily: popionsMedium),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 14.5,
                              ),
                              const Text(
                                'Jim has done a fabulous job, it took exactly the same time as mentioned and he came on time to our doorstep.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGreyColor,
                                    fontFamily: popionsRegular),
                              )
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          );
        });
  }
}
