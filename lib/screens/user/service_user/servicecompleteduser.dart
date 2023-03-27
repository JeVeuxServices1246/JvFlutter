import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class ServiceCompletedUser extends StatefulWidget {
  const ServiceCompletedUser({super.key});

  @override
  State<ServiceCompletedUser> createState() => _ServiceCompletedUserState();
}

class _ServiceCompletedUserState extends State<ServiceCompletedUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icon/thumbs_up.png',
                height: 64,
                width: 64,
              ),
            ),
            const SizedBox(
              height: 23.52,
            ),
            const Text(
              'Service Completed',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffF5C443),
                  fontWeight: FontWeight.w700,
                  fontFamily: popionsBold),
            ),
            const SizedBox(
              height: 4.27,
            ),
            const Text(
              'Dear Harry Styles please share your valuable feedback. This will help us improve our services.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff161616),
                  fontFamily: popionsRegular),
            ),
            const Spacer(),
            serviceUI(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.26, right: 18.26),
              child: customBtn(
                  'Share Feedback', Color(0xff0D0D0D), Colors.white, () {
                Get.toNamed(MyRouter.sharefeedback);
              }),
            ),
            const SizedBox(
              height: 19,
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
}
