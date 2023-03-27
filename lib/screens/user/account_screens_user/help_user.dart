import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';

class HelpUser extends StatefulWidget {
  const HelpUser({super.key});

  @override
  State<HelpUser> createState() => _HelpUserState();
}

class _HelpUserState extends State<HelpUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const PoppinsAddText(
          textAlign: TextAlign.start,
          text: AppStrings.supportTitle,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/headphone.png',
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 34, right: 34, top: 50),
              child: PoppinsAddText(
                textAlign: TextAlign.start,
                text: AppStrings.supportSubTitle,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.supportChatScreen);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 62,
                // height: 54,
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF0F0F0)),

                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppAssets.messageSupport,
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: PoppinsAddText(
                        textAlign: TextAlign.center,
                        text: AppStrings.chatSupport,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset(AppAssets.forwordAccount),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.notificationScreen);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 62,
                // height: 54,
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffF0F0F0)),

                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppAssets.callSupport,
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: PoppinsAddText(
                        textAlign: TextAlign.center,
                        text: AppStrings.callSupport,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  child: Image.asset(AppAssets.forwordAccount),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Color(0xffF0F0F0)),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.mail_outline_sharp,
                  color: Color(0xff444444),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const PoppinsAddText(
              textAlign: TextAlign.start,
              text: AppStrings.mail1,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            PoppinsAddText(
              textAlign: TextAlign.start,
              text: AppStrings.mail2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
