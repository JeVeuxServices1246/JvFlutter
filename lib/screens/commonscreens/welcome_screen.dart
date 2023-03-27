import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final style = TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 23, right: 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(top: 110),
              child: Image.asset(
                AppAssets.welcomeLogo,
                height: 182,
                width: 182,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(
                AppAssets.welcomeLine,
                height: 80,
                width: 6,
              ),
              const SizedBox(
                width: 13,
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      AppStrings.welcomeTextTitle,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(AppStrings.welcomeTextSubTitle,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff717171),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 69,
          ),
          Row(
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  Get.toNamed(MyRouter.pRegister);
                },
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(AppStrings.professionalButton,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      )),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                  child: customBtn('JV User', Colors.black, Colors.white, () {
                Get.offNamed(MyRouter.onMobileLoginScreen);
              }))
            ],
          ),
          const SizedBox(
            height: 46,
          )
        ],
      ),
    ));
  }
}
