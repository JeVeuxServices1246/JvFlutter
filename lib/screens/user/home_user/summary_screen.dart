import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/dimensions.dart';
import 'package:jv_app/screens/user/widgets/radio_circle.dart';

enum AddressFlow { step1, step2, step3 }

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  showFilterButtonSheet() {
    selectedAddress.value = -1;
    selectedAddressType.value = -1;
    flow.value = AddressFlow.step1;
    slot1.value = -1;
    slot2.value = -1;
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        isDismissible: true,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * .85,
          maxHeight: MediaQuery.of(context).size.height * .86,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              padding: EdgeInsets.only(
                  top: AddSize.padding14,
                  left: AddSize.padding20,
                  right: AddSize.padding20),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Obx(() {
                          return Column(
                            children: [
                              if (flow.value == AddressFlow.step1) step1(),
                              if (flow.value == AddressFlow.step2) step2(),
                              if (flow.value == AddressFlow.step3) step3(),
                              // if (flow.value == AddressFlow.step1) step1(),
                              // if (flow.value == AddressFlow.step1) step1(),
                            ],
                          );
                        }),
                      ),
                    ),
                    if (flow.value == AddressFlow.step1)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Obx(() {
                          return ElevatedButton(
                              onPressed: () {
                                if (selectedAddress.value != -1) {
                                  flow.value = AddressFlow.step2;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.maxFinite, 50),
                                  backgroundColor: selectedAddress.value != -1
                                      ? Colors.black
                                      : const Color(0xffD8D8D8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "Add address and slot",
                                style: TextStyle(
                                    color: selectedAddress.value != -1
                                        ? Colors.white
                                        : const Color(0xff858585),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ));
                        }),
                      ),
                    if (flow.value == AddressFlow.step2)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Obx(() {
                          return ElevatedButton(
                              onPressed: () {
                                if (selectedAddressType.value != -1) {
                                  flow.value = AddressFlow.step3;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.maxFinite, 50),
                                  backgroundColor:
                                      selectedAddressType.value != -1
                                          ? Colors.black
                                          : const Color(0xffD8D8D8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "Add address and slot",
                                style: TextStyle(
                                    color: selectedAddressType.value != -1
                                        ? Colors.white
                                        : const Color(0xff858585),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ));
                        }),
                      ),
                    if (flow.value == AddressFlow.step3)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Obx(() {
                          return ElevatedButton(
                              onPressed: () {
                                Get.toNamed(MyRouter.paymentOption);
                                // flow.value = AddressFlow.step3;
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.maxFinite, 50),
                                  backgroundColor:
                                      slot1.value != -1 && slot2.value != -1
                                          ? Colors.black
                                          : const Color(0xffD8D8D8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "Add address and slot",
                                style: TextStyle(
                                    color:
                                        slot1.value != -1 && slot2.value != -1
                                            ? Colors.white
                                            : const Color(0xff858585),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ));
                        }),
                      ),
                  ],
                );
              }),
            ));
  }

  Column step1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Select Address",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(
                Icons.add,
                color: Color(0xff5E17EB),
                size: 22,
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Text(
                  "Add another address",
                  style: TextStyle(
                      color: Color(0xff5E17EB),
                      height: 1.4,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Saved addresses",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
            separatorBuilder: (_, __) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),
            itemCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Obx(() {
                return InkWell(
                  onTap: () {
                    selectedAddress.value = index;
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: RadioCircle(
                          selected: selectedAddress.value == index,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Ayodhya Nagar Extension, Ayodhya Bypass",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.adaptive.arrow_forward,
                        size: 20,
                      )
                    ],
                  ),
                );
              });
            }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column step2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Bhel Nagar",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Bhel Nagar, Piplani, Ayodhya Bypass, Bhopal, Madhya Pradesh 462022, India ",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              hintText: "House/Flat Number *",
              // prefixIcon: Icon(
              //   Icons.search,
              //   color: Colors.grey.shade700,
              // ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14)),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              hintText: "Landmark (Optional)",
              // prefixIcon: Icon(
              //   Icons.search,
              //   color: Colors.grey.shade700,
              // ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14)),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Save as",
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: List.generate(
              2,
              (index) => Obx(() {
                    return GestureDetector(
                      onTap: () {
                        selectedAddressType.value = index;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: selectedAddressType.value == index
                                    ? const Color(0xff5E17EB)
                                    : Colors.black),
                            color: selectedAddressType.value == index
                                ? const Color(0xff5E17EB).withOpacity(.3)
                                : Colors.white),
                        margin: const EdgeInsets.only(right: 14),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Text(
                          "Home$index",
                          style: TextStyle(
                              color: selectedAddressType.value == index
                                  ? const Color(0xff5E17EB)
                                  : Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  })),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Column step3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Select date and time ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Your service will take approx. 45 mins",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(() {
                  return Tooltip(
                    message: "Sat$index",
                    triggerMode: TooltipTriggerMode.tap,
                    onTriggered: () {
                      slot1.value = index;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: slot1.value == index
                                  ? const Color(0xff5E17EB)
                                  : Colors.black),
                          color: slot1.value == index
                              ? const Color(0xff5E17EB).withOpacity(.3)
                              : Colors.white),
                      margin: const EdgeInsets.only(right: 14),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              "Sat$index",
                              style: TextStyle(
                                  color: slot1.value == index
                                      ? const Color(0xff5E17EB)
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "${index + 10}",
                              style: TextStyle(
                                  color: slot1.value == index
                                      ? const Color(0xff5E17EB)
                                      : Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Save as",
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 28,
          child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(() {
                  return GestureDetector(
                    onTap: () {
                      slot2.value = index;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1,
                              color: slot2.value == index
                                  ? const Color(0xff5E17EB)
                                  : Colors.black),
                          color: slot2.value == index
                              ? const Color(0xff5E17EB).withOpacity(.3)
                              : Colors.white),
                      margin: const EdgeInsets.only(right: 14),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: Text(
                        "Home$index",
                        style: TextStyle(
                            color: slot2.value == index
                                ? const Color(0xff5E17EB)
                                : Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                });
              }),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Rx<AddressFlow> flow = AddressFlow.step1.obs;

  RxInt selectedAddress = (-1).obs;
  RxInt selectedAddressType = (-1).obs;
  RxInt slot1 = (-1).obs;
  RxInt slot2 = (-1).obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Summary",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: service(),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 2),
                  BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(-1, -1),
                      spreadRadius: 1,
                      blurRadius: 2),
                ],
                borderRadius: BorderRadius.circular(16)),
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Payment Summary",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 14,
                ),
                summaryItems(text1: "Item Total", text2: "₹699"),
                summaryItems(
                    text1: "Item Discount",
                    text2: "-₹50",
                    color: const Color(0xff52B46B)),
                summaryItems(text1: "Convenience Fee", text2: "₹50"),
                const SizedBox(
                  height: 12,
                ),
                summaryItems(
                    text1: "Grand Total",
                    text2: "₹749",
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff52B46B).withOpacity(.3),
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: const Text(
                    "Hurray ! You saved ₹50 on final bill",
                    style: TextStyle(
                      color: Color(0xff52B46B),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 26),
        child: ElevatedButton(
            onPressed: () {
              showFilterButtonSheet();
            },
            style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width, 50),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              "Add address and slot",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            )),
      ),
    );
  }

  summaryItems({
    required text1,
    required text2,
    Color? color = Colors.black,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            text1,
            style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
          )),
          Text(
            text2,
            style: TextStyle(
                color: color, fontWeight: fontWeight, fontSize: fontSize),
          )
        ],
      ),
    );
  }

  service() {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(MyRouter.summaryScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffF2ECFD),
            borderRadius: BorderRadius.circular(14)),
        width: double.maxFinite,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selected Services",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: "https://images.news18.com/"
                        "ibnkhabar/uploads/2021/06/body-spa.jpg?"
                        "im=FitAndFill,width=480,aspect=fit,"
                        "type=normal",
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                    errorWidget: (_, __, ___) => const SizedBox(),
                    placeholder: (_, __) => const SizedBox(),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Diamond Facial",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "₹699",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff5E17EB)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.circle,
                              size: 10,
                              color: Color(0xff757575),
                            ),
                            Text(
                              "  For all skin types. Pinacolada mask.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0xff757575)),
                            )
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
