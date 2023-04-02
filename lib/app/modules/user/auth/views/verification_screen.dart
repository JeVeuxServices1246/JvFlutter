

// ignore_for_file: unrelated_type_equality_checks

// class VerificationScreen extends GetView<SignupController> {
//   const VerificationScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     SignupController controller = Get.find<SignupController>();
//     var deviceWidth = MediaQuery.of(context).size.width;
//     var deviceHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Center(
//             child: Text(AppStrings.appVerificationOtp,
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.josefinSans(
//                   textStyle: const TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 23,
//                     color: Colors.black,
//                   ),
//                 ))),
//       ),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             Container(
//                 padding: const EdgeInsets.only(left: 0.1, top: 100, right: 0.1),
//                 height: AddSize.screenHeight,
//                 width: AddSize.screenWidth,
//                 child: Image.asset(
//                   AppAssets.verification,
//                   height: deviceHeight,
//                   fit: BoxFit.fill,
//                   width: deviceWidth,
//                 )),
//             SingleChildScrollView(
//               child: Container(
//                   padding: const EdgeInsets.only(left: 40, right: 25, top: 155),
//                   child: Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(AppStrings.conformVerificationOtp,
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.roboto(
//                               textStyle: const TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 17,
//                                   color: Colors.white),
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 55,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                             '${AppStrings.titleVerificationOtp} ${controller.mobileController.text}',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.roboto(
//                               textStyle: const TextStyle(
//                                   letterSpacing: 0,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 17,
//                                   color: Colors.white),
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       Container(
//                         child: PinCodeTextField(
//                           autoDisposeControllers: false,
//                           controller: controller.otpController,
//                           appContext: context,
//                           length: 4,
//                           obscureText: false,
//                           animationType: AnimationType.fade,
//                           pinTheme: PinTheme(
//                             shape: PinCodeFieldShape.circle,
//                             fieldHeight: 80,
//                             fieldWidth: 50,
//                             activeColor: Colors.grey,
//                             inactiveColor: Colors.grey,
//                             inactiveFillColor: Colors.grey,
//                             selectedColor: Colors.grey,
//                             selectedFillColor: Colors.white,
//                             disabledColor: Colors.grey,
//                             activeFillColor: Colors.grey,
//                           ),
//                           animationDuration: const Duration(milliseconds: 300),
//                           enableActiveFill: true,
//                           onCompleted: (v) {
//                             controller.otpController.text = v;
//                             controller.verifyOtp(v);
//                           },
//                           onChanged: (String value) {},
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child:
//                             Text(AppStrings.resendVerificationOtp.toUpperCase(),
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.roboto(
//                                   textStyle: const TextStyle(
//                                       letterSpacing: 0,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 17,
//                                       color: Colors.white),
//                                 )),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       MaterialButton(
//                         minWidth: MediaQuery.of(context).size.width,
//                         height: 55,
//                         color: Colors.grey,
//                         shape: RoundedRectangleBorder(
//                           side: const BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         onPressed: () {
//                           controller.verifyOtp(controller.otpController.text);
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(2),
//                           child: Text(
//                               AppStrings.verifyVerificationOtp.toUpperCase(),
//                               style: GoogleFonts.roboto(
//                                 textStyle: const TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 15,
//                                   letterSpacing: 1,
//                                   color: Colors.white,
//                                 ),
//                               )),
//                         ),
//                       )
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_app/app/modules/user/auth/signup/controller/signup_controller.dart';
import 'package:jv_app/app/modules/user/auth/views/new_password.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../resources/app_assets.dart';
import '../../../../../resources/strings.dart';
import 'package:country_calling_code_picker/picker.dart';



class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);


  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  SignupController registrationController = Get.put(SignupController());

  final style = const TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
  late Timer _timer;
  RxInt start = 60.obs;
  @override
  void initState() {
    super.initState();
    startTimer();

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(milliseconds:500);
    _timer = Timer.periodic(
        oneSec,
            (Timer timer) => setState(() {
          if (start ==0) {
            timer.cancel();
          } else {
            start = start -1;
          }
        }));
  }



  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 0.1, top: 100, right: 0.1),
                height: deviceHeight,
                width: deviceWidth,
                child: Container(
                    child: Image.asset(
                      AppAssets.verification,
                      height: deviceHeight,
                      fit: BoxFit.fill,
                      width: deviceWidth,
                    ))),
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
                        child: Text("${AppStrings.titleVerificationOtp}${" "}${"+"}${registrationController.dialCode}${"- "}${registrationController.mobileController.text}",
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
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          autovalidateMode:AutovalidateMode.always,
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
                          // errorAnimationController: errorController,
                          //controller: textEditingController,
                          //runs when every textfield is filled
                          onCompleted: (v) {
                            registrationController.otp.value = v;
                          },
                          onChanged: (value) {
                            registrationController.otp.value=value;
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          InkWell(onTap:(){
                            if(Get.arguments=="forget password")
                            {
                              registrationController.resendSendOTP(true);
                            }else{
                              registrationController.resendSendOTP(false);
                            }

                            start.value = 60;
                            startTimer();
                          },
                            child: Visibility(
                              visible:start==0?true:false,
                              child: Text(AppStrings.resendVerificationOtp.toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      decoration: TextDecoration.underline,
                                      fontSize:12,
                                      color:Colors.white),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Visibility(
                            visible:start==0?false:true,
                            child: Text("00: ${start.value}",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                        ],
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
                          if (registrationController.otp.value.isNotEmpty) {
                            if(registrationController.otp.value.toString()==registrationController.currentOtp.value.toString()){
                              if(Get.arguments=="forget password")
                              {
                                Get.toNamed(MyRouter.newPassword);
                              }else{
                                Get.toNamed(MyRouter.signupScreen);
                              }

                            }else{
                              var snackBar = const SnackBar(
                                content: Text('Enter a valid OTP'),
                              );
                              ScaffoldMessenger.of(
                                  context).showSnackBar(
                                  snackBar);
                            }
                          }
                          else{
                            var snackBar = const SnackBar(
                              content: Text('Enter OTP'),
                            );
                            ScaffoldMessenger.of(
                                context).showSnackBar(
                                snackBar);
                          }
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


