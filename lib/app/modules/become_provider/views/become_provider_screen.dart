import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jv_app/app/modules/become_provider/controllers/become_provider_controller.dart';
import 'package:jv_app/app/modules/become_provider/widgets/upload_document_widget.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/dimensions.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/screens/user/widgets/custom_textfield.dart';
import 'package:jv_app/utils/hive_utils.dart';
import 'package:jv_app/utils/session_key.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';


class BecomeProviderScreen extends GetView<BecomeProviderController> {
  const BecomeProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.blackColor,
        title: const Text('Become Provider'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 26),
        child: ElevatedButton(
            onPressed: () {
              // controller.uploadImage(controller.frontDl.value ?? XFile(''));
              controller.UpdateProfile();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(AddSize.width100, 50),
                backgroundColor: AppColors.blackColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const PoppinsAddText(
              textAlign: TextAlign.start,
              text: "Next >", // AppStrings.submit,
              fontSize: 14,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: controller.firstNameController,
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: controller.lastNameController,
                    hintText: 'Last Name',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextField(
              isEnabled: false,
              controller: controller.mobileController,
              hintText: 'Mobile (${HiveUtils.getSession<String>(SessionKey.countrycode)})',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              // isEnabled: false,
              controller: controller.userNameController,
              hintText: 'Username ',
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: controller.emailController,
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    // Show the OTP row
                    controller.showOtpRow();
                  },
                  style: ElevatedButton.styleFrom(
                    // minimumSize: const Size(AddSize.width100, 50),
                    backgroundColor: AppColors.blackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Send OTP',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.showOtp.value) {
                return Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: controller.otpController,
                        hintText: 'Enter OTP',
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Hide the OTP row
                        controller.hideOtpRow();
                      },
                      style: ElevatedButton.styleFrom(
                        // minimumSize: const Size(AddSize.width100, 50),
                        backgroundColor: AppColors.blackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
            const SizedBox(height: 30),
            const Text(
              'Upload Driving License',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                      () => UploadDocumentWidget(
                    innerWidget: controller.frontDl.value?.path.isNotEmpty ??
                        false
                        ? Image.file(File(controller.frontDl.value?.path ?? ""),
                        fit: BoxFit.cover)
                        : const Icon(Icons.upload_outlined),
                    name: 'Front',
                    onTap: () => controller.pickImage(true),
                  ),
                ),
                Obx(
                      () => UploadDocumentWidget(
                      innerWidget: controller.backDl.value?.path.isNotEmpty ??
                          false
                          ? Image.file(File(controller.backDl.value?.path ?? ""),
                          fit: BoxFit.cover)
                          : const Icon(Icons.upload_outlined),
                      name: 'Back',
                      onTap: () => controller.pickImage(false)),
                )
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Hide the OTP row
            //     controller.UpdateProfile();
            //   },
            //   style: ElevatedButton.styleFrom(
            //     // minimumSize: const Size(AddSize.width100, 50),
            //     backgroundColor: AppColors.blackColor,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   child: const Text(
            //     'Next >',
            //     style:
            //     TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            //   ),
            // ),
          ],
        ).paddingSymmetric(horizontal: 12),
      ),
    );
  }
}
