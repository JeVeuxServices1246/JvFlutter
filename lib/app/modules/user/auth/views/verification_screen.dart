import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_app/app/modules/user/auth/signup/controller/signup_controller.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/dimensions.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends GetView<SignupController> {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.find<SignupController>();
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(AppStrings.appVerificationOtp,
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ))),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 0.1, top: 100, right: 0.1),
                height: AddSize.screenHeight,
                width: AddSize.screenWidth,
                child: Image.asset(
                  AppAssets.verification,
                  height: deviceHeight,
                  fit: BoxFit.fill,
                  width: deviceWidth,
                )),
            SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 25, top: 155),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(AppStrings.conformVerificationOtp,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                            '${AppStrings.titleVerificationOtp} ${controller.mobileController.text}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: PinCodeTextField(
                          autoDisposeControllers: false,
                          controller: controller.otpController,
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            fieldHeight: 80,
                            fieldWidth: 50,
                            activeColor: Colors.grey,
                            inactiveColor: Colors.grey,
                            inactiveFillColor: Colors.grey,
                            selectedColor: Colors.grey,
                            selectedFillColor: Colors.white,
                            disabledColor: Colors.grey,
                            activeFillColor: Colors.grey,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onCompleted: (v) {
                            controller.otpController.text = v;
                            controller.verifyOtp(v);
                          },
                          onChanged: (String value) {},
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child:
                            Text(AppStrings.resendVerificationOtp.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: Colors.white),
                                )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 55,
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          controller.verifyOtp(controller.otpController.text);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                              AppStrings.verifyVerificationOtp.toUpperCase(),
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  letterSpacing: 1,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

// class VerificationScreen extends StatefulWidget {
//   const VerificationScreen({Key? key}) : super(key: key);
//
//   @override
//   _VerificationScreenState createState() => _VerificationScreenState();
// }
//
// class _VerificationScreenState extends State<VerificationScreen> {
//   Country? _selectedCountry;
//   final style = TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
//
//   @override
//   void initState() {
//     initCountry();
//     super.initState();
//   }
//
//   void initCountry() async {
//     final country = await getDefaultCountry(context);
//     setState(() {
//       _selectedCountry = country as Country?;
//     });
//   }
// }
