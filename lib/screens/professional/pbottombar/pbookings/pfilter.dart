import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/controllers/p_filter_controller.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/get_text.dart';
import 'package:jv_app/screens/user/widgets/bottomindicator.dart';
import 'package:jv_app/screens/user/widgets/custombtn.dart';

class PFilter extends StatefulWidget {
  const PFilter({super.key});

  @override
  State<PFilter> createState() => _PFilterState();
}

class _PFilterState extends State<PFilter> {
  final controller = Get.put(PFilterController());

  double distanceSlider = 0.0;
  RangeValues priceSlider = const RangeValues(10, 90);
  double priceStartSlider = 10;
  double priceEndSlider = 90;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Row(
            children: const [
              GetText(
                  text: 'Filters',
                  size: 16,
                  fontFamily: popionsMedium,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor),
              Spacer(),
              GetText(
                  text: 'clear all',
                  size: 12,
                  fontFamily: popionsMedium,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlackColor),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 1,
          color: const Color(0xffEBEBEB),
        ),
        Expanded(child: filterWidget()),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Flexible(
                  child: customBtn(
                      'Close', const Color(0xffA8A8A8), AppColors.whiteColor,
                      () {
                Navigator.pop(context);
              })),
              const SizedBox(
                width: 13,
              ),
              Flexible(
                  child: customBtn('Apply', AppColors.blackColor,
                      AppColors.whiteColor, () {})),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        bottomIndicatorWidget(),
      ]),
    );
  }

  filterWidget() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              customFilterContainer('Date', 0, () {
                controller.changeValue(0);
              }),
              customFilterContainer('Billing', 1, () {
                controller.changeValue(1);
              }),
              customFilterContainer('Service', 2, () {
                controller.changeValue(2);
              }),
              Flexible(
                  child: Container(
                width: 110,
                color: const Color(0xffEBEBEB),
              ))
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Obx(() => controller.selectedFilterIndex.value == 0
              ? Flexible(
                  child: dateWidget(),
                )
              : controller.selectedFilterIndex.value == 1
                  ? Flexible(child: billingWidget())
                  : Flexible(child: serviceWidget())),
        ],
      ),
    );
  }

  customFilterContainer(String title, int index, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Obx(
        () => Container(
          width: 110,
          height: 50,
          color: controller.selectedFilterIndex.value == index
              ? AppColors.whiteColor
              : const Color(0xffEBEBEB),
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: GetText(
              text: title,
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor),
        ),
      ),
    );
  }

  dateWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GetText(
              text: 'Select a date',
              size: 16,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor),
          const SizedBox(
            height: 11,
          ),
          dateTextField()
        ],
      ),
    );
  }

  serviceWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GetText(
              text: 'Select Service',
              size: 16,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor),
          const SizedBox(
            height: 26,
          ),
          customRowWidgetForService('Service name 1', '32', 1, () {
            setState(() {
              controller.onChangedCheckbox(1);
            });
          }),
          const SizedBox(
            height: 10,
          ),
          customRowWidgetForService('Service name 2', '02', 2, () {
            setState(() {
              controller.onChangedCheckbox(2);
            });
          }),
          const SizedBox(
            height: 10,
          ),
          customRowWidgetForService('Service name 3', '11', 3, () {
            setState(() {
              controller.onChangedCheckbox(3);
            });
          }),
          const SizedBox(
            height: 10,
          ),
          customRowWidgetForService('Service name 4', '00', 4, () {
            setState(() {
              controller.onChangedCheckbox(4);
            });
          }),
          const SizedBox(
            height: 10,
          ),
          customRowWidgetForService('Service name 5', '45', 5, () {
            setState(() {
              controller.onChangedCheckbox(5);
            });
          }),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  billingWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GetText(
              text: 'Billing Range',
              size: 16,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor),
          const SizedBox(
            height: 11,
          ),
          const GetText(
              text: '₹499 - ₹9999',
              size: 14,
              fontFamily: popionsBold,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlackColor),
          RangeSlider(
              activeColor: AppColors.blackColor,
              inactiveColor: const Color(0xffD9D9D9),
              values: RangeValues(priceStartSlider, priceEndSlider),
              max: 20000,
              min: 10,
              onChanged: (val) {
                setState(() {
                  priceStartSlider = val.start;
                  priceEndSlider = val.end;
                });
              }),
        ],
      ),
    );
  }

  customRowWidgetForService(
      String title, String price, int index, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          checkBox(index),
          const SizedBox(
            width: 8,
          ),
          GetText(
              text: title,
              size: 14,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.textBlackColor),
          const Spacer(),
          GetText(
              text: price,
              size: 12,
              fontFamily: popionsRegular,
              fontWeight: FontWeight.w400,
              color: AppColors.lightGreyColor)
        ],
      ),
    );
  }

  checkBox(int index) {
    return Obx(
      () => Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: controller.selectedCheckbox.value == index
                ? AppColors.blackColor
                : const Color(0xffEBEBEB)),
        alignment: Alignment.center,
        child: controller.selectedCheckbox.value == index
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 14,
              )
            : Container(),
      ),
    );
  }

  dateTextField() {
    return Container(
      height: 47,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff79747E), width: 1)),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Container(
              width: 50,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icon/datepickericon.png',
                height: 24,
                width: 24,
              ),
            )),
      ),
    );
  }
}
