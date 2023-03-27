import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_app/controllers/edit_profile_controller.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';


class SupportUser extends StatefulWidget {
  const SupportUser({Key? key}) : super(key: key);

  @override
  State<SupportUser> createState() => _SupportUserState();
}

class _SupportUserState extends State<SupportUser> {
  TextEditingController numberController = TextEditingController();

  final controller = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          text: AppStrings.profileTitle,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: AppStrings.name,
                fontSize: 12,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              TextField(
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'enter name',
                  hintStyle: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: AppStrings.email,
                fontSize: 12,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              Container(
                child: TextField(
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'enter email',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const PoppinsAddText(
                textAlign: TextAlign.start,
                text: AppStrings.mobileNo,
                fontSize: 12,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              TextField(
                controller: numberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10)
                ],
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'enter mobile no',
                  hintStyle: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                onChanged: (val) {
                  controller.updateNumberCount(val.length);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 26),
        child: ElevatedButton(
            onPressed: () {
              //showFilterButtonSheet();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width, 50),
                backgroundColor: controller.numberCount > 9
                    ? Colors.black
                    : Color(0xffD8D8D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: PoppinsAddText(
              textAlign: TextAlign.start,
              text: AppStrings.saveChange,
              fontSize: 14,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: controller.numberCount > 9
                  ? Colors.white
                  : const Color(0xff858585),
            )),
      ),
    );
  }
}
