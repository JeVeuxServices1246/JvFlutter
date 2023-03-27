import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PCompleteWidget extends StatefulWidget {
  const PCompleteWidget({super.key});

  @override
  State<PCompleteWidget> createState() => _PCompleteWidgetState();
}

class _PCompleteWidgetState extends State<PCompleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Flexible(child: searchWidget()),
                const SizedBox(
                  width: 16,
                ),
                filterWidget()
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          completedWidget(),
          const SizedBox(
            height: 16,
          ),
          completedWidget(),
        ],
      ),
    );
  }

  searchWidget() {
    return TextFormField(
      readOnly: true,
      onTap: () {
        Get.toNamed(MyRouter.pSearch);
      },
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
          hintText: "Search by service name",
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor,
              fontFamily: popionsRegular),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade700,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14)),
    );
  }

  filterWidget() {
    return InkWell(
      onTap: () {
        Get.toNamed(MyRouter.pFilter);
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffE3E3E3),
            ),
            borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/icon/filter.png',
          width: 25,
          height: 25,
        ),
      ),
    );
  }

  completedWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF0F0F0)),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GetText(
              text: 'Harry Styles',
              size: 20,
              fontFamily: popionsBold,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor),
          const GetText(
              text: '10 Apr, 02:30 pm',
              size: 14,
              fontFamily: popionsMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.textBlackColor),
          const SizedBox(
            height: 12,
          ),
          customRowWidgetForComplete('Facial for glow - Gold facial'),
          customRowWidgetForComplete('Threading'),
          const SizedBox(
            height: 12,
          ),
          customBtn('View details', AppColors.blackColor, AppColors.whiteColor,
              () {
            Get.toNamed(MyRouter.pViewBooking);
          })
        ],
      ),
    );
  }

  customRowWidgetForComplete(String title) {
    return Row(
      children: [
        Container(
          height: 4,
          width: 4,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.lightGreyColor),
        ),
        const SizedBox(
          width: 8,
        ),
        GetText(
            text: title,
            size: 14,
            fontFamily: popionsRegular,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGreyColor)
      ],
    );
  }
}
