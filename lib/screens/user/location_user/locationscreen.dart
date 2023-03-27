import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
          text: AppStrings.locationTitle,
          fontSize: 20,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon/carbon_location.png',
              height: 88,
              width: 88,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Hello, nice to meet you!',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xffB4B4B4),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'See services around',
              style: TextStyle(
                  color: Color(0xff202020),
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                  fontFamily: robotMedium),
            ),
            const SizedBox(
              height: 51,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffD1D1D1)),
                    borderRadius: BorderRadius.circular(46)),
                padding: const EdgeInsets.only(left: 3),
                child: Row(
                  children: [
                    Flexible(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffB4B4B4),
                          ),
                          border: InputBorder.none,
                          hintText: 'Other location search',
                          hintStyle: TextStyle(
                              color: Color(0xffB4B4B4),
                              fontSize: 17,
                              fontWeight: FontWeight.w400)),
                    )),
                    Container(
                      width: 84,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(46),
                              bottomRight: Radius.circular(46)),
                          color: Colors.black),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/icon/zoomlocation.png',
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
