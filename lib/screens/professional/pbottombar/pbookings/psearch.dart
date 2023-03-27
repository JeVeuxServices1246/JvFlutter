import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/app_theme.dart';

class PSearch extends StatefulWidget {
  const PSearch({super.key});

  @override
  State<PSearch> createState() => _PSearchState();
}

class _PSearchState extends State<PSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        child: Column(
          children: [
            searchWidget(),
            const Expanded(child: Center(child: Text('No data available')))
          ],
        ),
      ),
    );
  }

  searchWidget() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffE3E3E3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffE3E3E3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffE3E3E3)),
          ),
          prefixIcon: IconButton(
              splashRadius: 2,
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.grey.shade700,
              )),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14)),
    );
  }
}
