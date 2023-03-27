import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class BookingSuccessfullyUser extends StatefulWidget {
  const BookingSuccessfullyUser({super.key});

  @override
  State<BookingSuccessfullyUser> createState() =>
      _BookingSuccessfullyUserState();
}

class _BookingSuccessfullyUserState extends State<BookingSuccessfullyUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/smiliemoji.png',
                  width: 72,
                  height: 62.46,
                ),
              ),
              const SizedBox(
                height: 17.54,
              ),
              const Text(
                AppStrings.bookingSuccessfully,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: popionsBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                      text:
                          'Dear Harry Styles you have successfully\nscheduled booking of',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff161616)),
                      children: [
                        TextSpan(
                            text: ' dash service ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff161616),
                            ),
                            children: [
                              TextSpan(
                                  text: 'for\nthe upcoming date',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff161616)),
                                  children: [
                                    TextSpan(
                                        text: ' 12 Dec. ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff161616),
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                'Our service\nprovider will contact you soon.',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff161616)),
                                          )
                                        ])
                                  ])
                            ])
                      ])),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffF3F3F3),
                      border: Border.all(width: 2, color: Color(0xffF3F3F3))),
                  padding: const EdgeInsets.only(
                      top: 16, left: 18.52, bottom: 16, right: 2),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.asset(
                          'assets/images/bookingimg2.png',
                          width: 114.13,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 18.26,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Diamond Facial',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff161616)),
                            ),
                            const SizedBox(
                              height: 4,
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
                                  width: 9.13,
                                ),
                                const Text(
                                  '1 hr',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.lightGreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: popionsRegular),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 4,
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
                                  width: 9.13,
                                ),
                                const Flexible(
                                  child: Text(
                                    'Includes dummy info',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.lightGreyColor,
                                        fontWeight: FontWeight.w400,
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
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: customBtn(
                    'View booking', Colors.black, Colors.white, () {}),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
