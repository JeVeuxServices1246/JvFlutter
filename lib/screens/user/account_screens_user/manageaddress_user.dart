import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';

class ManageAddressUser extends StatefulWidget {
  const ManageAddressUser({super.key});

  @override
  State<ManageAddressUser> createState() => _ManageAddressUserState();
}

class _ManageAddressUserState extends State<ManageAddressUser> {
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
          text: AppStrings.manageTitle,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addAddressUI(),
            const SizedBox(
              height: 24,
            ),
            addressUI()
          ],
        ),
      ),
    );
  }

  addressUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: PoppinsAddText(
            textAlign: TextAlign.start,
            text: "Home",
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: PoppinsAddText(
            textAlign: TextAlign.start,
            text:
                '89, Bhel Nagar, Piplani, Ayodhya Bypass, Bhopal,Madhya Pradesh 462022, India ',
            fontSize: 14,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
            color: Color(0xff757575),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Divider(
          color: AppColors.dividerColor,
          thickness: 1,
        )
      ],
    );
  }

  addAddressUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              Image.asset(
                AppAssets.addIcon,
                width: 16,
                height: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: AppStrings.addAddress,
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Color(0xff525252),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(
          color: AppColors.dividerColor,
          thickness: 1,
        )
      ],
    );
  }
}
