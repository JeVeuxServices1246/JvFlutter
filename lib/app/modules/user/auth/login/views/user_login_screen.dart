import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_app/app/modules/user/auth/login/controller/login_controller.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/strings.dart';

class UserLoginScreen extends GetView<LoginController> {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: deviceHeight / 1.7,
              width: deviceWidth,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Container(
                padding: const EdgeInsets.only(bottom: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.loginTitle,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(AppStrings.loginSubtitle,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: deviceWidth,
                    height: deviceHeight / 1.5,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    child: Container(
                      padding: const EdgeInsets.only(top: 60, left: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 5),
                            child: Column(
                              children: [
                                Text(AppStrings.PersonalInfo,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                        color: Colors.black,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () => controller.selectCountryCode(),
                                  child: Obx(
                                    () => Row(
                                      children: <Widget>[
                                        Image.asset(
                                          controller.selectedCountry.value.flag,
                                          package: countryCodePackageName,
                                          width: 30,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                          width: 10,
                                        ),
                                        Text(
                                            ' ${controller.selectedCountry.value.name}${" (${controller.selectedCountry.value.callingCode})"} ',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17,
                                                color: Colors.black,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 25),
                                  child: const Divider(
                                    height: 5,
                                    thickness: 1,
                                    color: Color(0xffACACAC),
                                  ),
                                ),
                                const SizedBox(
                                  height: 17,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 25),
                                  child: TextFormField(
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: true),
                                    controller: controller.mobileController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      hintText: 'Your phone number',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 17,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 25),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: controller.passwordController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      hintText: 'password',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () => Get.toNamed(MyRouter.signupScreen),
                                child: Text(
                                  'SignUp ?',
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.blackColor,
                                  )),
                                ),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 20),
                          const SizedBox(
                            height: 35,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 25),
                            child: Text(
                                'We will send you a verification \n code to your phone number',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: Color(0xffB4B4B4),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.signIn();
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                AppAssets.nextOnBoarding,
                                height: 50,
                                width: 50,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class Mobile_Login_screen extends  {
//   const Mobile_Login_screen({Key? key}) : super(key: key);
//
//   @override
//   _Mobile_Login_screenState createState() => _Mobile_Login_screenState();
// }
//
// class _Mobile_Login_screenState extends State<Mobile_Login_screen> {
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
//
//   @override
//   Widget build(BuildContext context) {
//     final country = _selectedCountry;
//     var deviceWidth = MediaQuery.of(context).size.width;
//     var deviceHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             Container(
//               height: deviceHeight / 1.7,
//               width: deviceWidth,
//               decoration: const BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(25),
//                       bottomRight: Radius.circular(25))),
//               child: Container(
//                 padding: const EdgeInsets.only(bottom: 150),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(AppStrings.loginTitle,
//                         style: GoogleFonts.roboto(
//                           textStyle: const TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 19,
//                             color: Colors.white,
//                           ),
//                         )),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(AppStrings.loginSubtitle,
//                         style: GoogleFonts.roboto(
//                           textStyle: const TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15,
//                             color: Colors.white,
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: Container(
//                     height: deviceHeight / 2,
//                     width: deviceWidth,
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(40),
//                             bottomRight: Radius.circular(40),
//                             topRight: Radius.circular(40),
//                             topLeft: Radius.circular(40))),
//                     child: Container(
//                       padding: const EdgeInsets.only(top: 60, left: 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.only(left: 20, right: 5),
//                             child: Column(
//                               children: [
//                                 Text(AppStrings.PersonalInfo,
//                                     textAlign: TextAlign.start,
//                                     style: GoogleFonts.roboto(
//                                       textStyle: const TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 19,
//                                         color: Colors.black,
//                                       ),
//                                     )),
//                                 const SizedBox(
//                                   height: 40,
//                                 ),
//                                 country == null
//                                     ? Container(
//                                         child: Text("Select Country"),
//                                       )
//                                     : GestureDetector(
//                                         onTap: () {
//                                           _onPressed();
//                                         },
//                                         child: Row(
//                                           children: <Widget>[
//                                             Image.asset(
//                                               country.flag,
//                                               package: countryCodePackageName,
//                                               width: 30,
//                                             ),
//                                             const SizedBox(
//                                               height: 16,
//                                               width: 10,
//                                             ),
//                                             Text(
//                                                 ' ${country.name}${" (" + country.callingCode + ")"} ',
//                                                 textAlign: TextAlign.center,
//                                                 style: GoogleFonts.roboto(
//                                                   textStyle: const TextStyle(
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 17,
//                                                     color: Colors.black,
//                                                   ),
//                                                 )),
//                                           ],
//                                         ),
//                                       ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.only(left: 0, right: 25),
//                                   child: const Divider(
//                                     height: 5,
//                                     thickness: 1,
//                                     color: Color(0xffACACAC),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 17,
//                                 ),
//                                 Container(
//                                   padding:
//                                       const EdgeInsets.only(left: 0, right: 25),
//                                   child: TextFormField(
//                                     controller: ,
//                                     obscureText: false,
//                                     decoration: const InputDecoration(
//                                       hintText: 'Your phone number',
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 14),
//                           Row(
//                             children: [
//                               Text(
//                                 'Login with password',
//                                 style: GoogleFonts.roboto(
//                                     textStyle: const TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                   color: AppColors.black,
//                                 )),
//                               ),
//                               Spacer(),
//                               Text(
//                                 'Register?',
//                                 style: GoogleFonts.roboto(
//                                     textStyle: const TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 14,
//                                   color: AppColors.black,
//                                 )),
//                               ),
//                             ],
//                           ).paddingSymmetric(horizontal: 20),
//                           const SizedBox(
//                             height: 35,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(left: 10, right: 25),
//                             child: Text(
//                                 'We will send you a verification \n code to your phone number',
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.roboto(
//                                   textStyle: const TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17,
//                                     color: Color(0xffB4B4B4),
//                                   ),
//                                 )),
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Get.toNamed(MyRouter.onVerificationScreen);
//                             },
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                   child: Image.asset(
//                                 AppAssets.nextOnBoarding,
//                                 height: 50,
//                                 width: 50,
//                               )),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _onPressed() async {
//     final country =
//         await Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return const PickerPage();
//     }));
//     if (country != null) {
//       setState(() {
//         _selectedCountry = country;
//       });
//     }
//   }
// }

class PickerPage extends StatelessWidget {
  const PickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country'),
      ),
      body: CountryPickerWidget(
        onSelected: (country) => Navigator.pop(context, country),
      ),
    );
  }
}
