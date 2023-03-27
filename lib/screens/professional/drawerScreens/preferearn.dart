import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';

class PReferEarn extends StatefulWidget {
  const PReferEarn({super.key});

  @override
  State<PReferEarn> createState() => _PReferEarnState();
}

class _PReferEarnState extends State<PReferEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5C443),
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
          text: AppStrings.referTitle,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                color: const Color(0xffF5C443),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/Gift.png',
                        width: 148.37,
                        height: 108,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 34, right: 30, top: 16),
                      child: PoppinsAddText(
                        textAlign: TextAlign.start,
                        text: "Refer now & earn up to ₹500",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 34, right: 30, top: 1),
                      child: PoppinsAddText(
                        textAlign: TextAlign.start,
                        text:
                            "Invite your friends to Seek Me service. They get instant ₹100 off. You win upto ₹500 in rewards",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                // height: 54,
                width: 228,

                padding: const EdgeInsets.only(top: 8, left: 0, bottom: 0),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text.rich(TextSpan(
                              text: 'Referral ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textBlackColor,
                                  fontFamily: popionsMedium,
                                  fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(
                                  text: 'Code',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textBlackColor,
                                      fontFamily: popionsBold,
                                      fontWeight: FontWeight.w700),
                                )
                              ])),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffF5C443)),
                            child: const PoppinsAddText(
                              textAlign: TextAlign.start,
                              text: "HSSMNW123",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 27, right: 27),
                child: Image.asset(
                  'assets/images/refer_provider.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              referAsUI('assets/images/refer1.png', 'User',
                  'profile can explore & book services in a min'),
              const SizedBox(
                height: 16,
              ),
              referAsUI('assets/images/refer2.png', 'Freelancer',
                  'profile can find multiple flexible jobs easily'),
              const SizedBox(
                height: 16,
              ),
              referAsUI('assets/images/refer3.png', 'Service Provider',
                  'profile can accept / reject and manage job requests'),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
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
