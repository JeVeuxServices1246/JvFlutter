import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class ShareFeedbackUser extends StatefulWidget {
  const ShareFeedbackUser({super.key});

  @override
  State<ShareFeedbackUser> createState() => _ShareFeedbackUserState();
}

class _ShareFeedbackUserState extends State<ShareFeedbackUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Feedback',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff161616),
              fontFamily: popionsBold),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.only(right: 22),
              child: const Icon(
                Icons.close,
                color: AppColors.lightGreyColor,
                size: 15,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 18, top: 19.52),
        child: SingleChildScrollView(
          child: Column(
            children: [
              serviceUI(),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'How would you rate the experience and service ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff161616),
                    fontFamily: popionsRegular),
              ),
              const SizedBox(
                height: 17.27,
              ),
              RatingBar(
                initialRating: 3,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 28,
                ratingWidget: RatingWidget(
                  full: Image.asset('assets/icon/star.png'),
                  half: Image.asset('assets/icon/unselected_star.png'),
                  empty: Image.asset('assets/icon/unselected_star.png'),
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(
                height: 20.37,
              ),
              const Text(
                '4 - Good',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: popionsRegular,
                    color: Color(0xff161616)),
              ),
              const SizedBox(
                height: 80,
              ),
              desTextField(),
              const SizedBox(
                height: 20,
              ),
              customBtn(
                  'Submit Feedback', Color(0xff0D0D0D), Colors.white, () {}),
              const SizedBox(
                height: 44,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget desTextField() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: 'Tell us on how we can improve',
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xffABABAB),
                fontFamily: popionsRegular),
            border: InputBorder.none),
      ),
    );
  }

  serviceUI() {
    return Container(
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
