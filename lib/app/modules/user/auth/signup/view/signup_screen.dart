import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_app/app/modules/user/auth/signup/controller/signup_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custom_textfield.dart';
import 'package:jv_app/utils/validator/validator.dart';

class SignUpScreen extends GetView<SignupController> {
  const SignUpScreen({Key? key}) : super(key: key);
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.registrationFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.selectCountryCode(),
                                    child: Obx(
                                      () => Row(
                                        children: <Widget>[
                                          Image.asset(
                                            controller
                                                .selectedCountry.value.flag,
                                            package: countryCodePackageName,
                                            width: 30,
                                          ),
                                          // Text(
                                          //     '${controller.selectedCountry.value.callingCode} ',
                                          //     textAlign: TextAlign.center,
                                          //     style: GoogleFonts.roboto(
                                          //       textStyle: const TextStyle(
                                          //         fontWeight: FontWeight.w400,
                                          //         fontSize: 17,
                                          //         color: Colors.black,
                                          //       ),
                                          //     )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Flexible(
                                    child: CustomTextField(
                                        validator: mandatoryValidator,
                                        hintText: 'Mobile',
                                        controller:
                                            controller.mobileController),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                        validator: mandatoryValidator,
                                        hintText: 'First Name',
                                        controller:
                                            controller.firstNameController),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: CustomTextField(
                                        validator: mandatoryValidator,
                                        hintText: 'Last Name',
                                        controller:
                                            controller.lastNameController),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              CustomTextField(
                                  hintText: 'Email',
                                  controller: controller.emailController),
                              SizedBox(height: 10),
                              CustomTextField(
                                  validator: mandatoryValidator,
                                  hintText: 'Password',
                                  controller: controller.password),
                              SizedBox(height: 10),
                              Obx(
                                () => CustomTextField(
                                    maxLines: 1,
                                    onTap: () => controller.showPassword(),
                                    obscureText:
                                        controller.isPasswordVisible.value,
                                    suffixIcon: GestureDetector(
                                      onTap: () => controller.showPassword(),
                                      child: Obx(() =>
                                          controller.isPasswordVisible.value
                                              ? const Icon(
                                                  Icons.visibility_off,
                                                  color: AppColors.blackColor,
                                                )
                                              : const Icon(
                                                  Icons.visibility,
                                                  color: AppColors.blackColor,
                                                )),
                                    ),
                                    validator: mandatoryValidator,
                                    hintText: 'Confirm Password',
                                    controller:
                                        controller.conformPasswordController),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              MaterialButton(
                                color: AppColors.blackColor,
                                textColor: AppColors.whiteColor,
                                onPressed: () {
                                  controller.sendOTP();
                                },
                                child: const Text(AppStrings.register),
                              ),
                              SizedBox(height: 30),
                              InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text('Do you have account Login?')),
                              SizedBox(height: 30),
                            ],
                          ).paddingSymmetric(horizontal: 12),
                        ),
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
