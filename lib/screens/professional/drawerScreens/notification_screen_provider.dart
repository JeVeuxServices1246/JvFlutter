import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/poppins_common_text.dart';

class NotificationScreenProvider extends StatefulWidget {
  const NotificationScreenProvider({Key? key}) : super(key: key);

  @override
  State<NotificationScreenProvider> createState() =>
      _NotificationScreenProviderState();
}

class _NotificationScreenProviderState
    extends State<NotificationScreenProvider> {
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
          title: PoppinsAddText(
            text: "Notification",
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          )),
      body: ListView.builder(
          itemCount: 13,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index1) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 0),
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xffe3e3e3)),
                          height: 50,
                          width: 50,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  child: Icon(Icons.notifications),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PoppinsAddText(
                              text: "Refer & Earn more",
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Bhel Nagar, Piplani, Ayodhya Bypass, Bhopal, Madhya Pradesh 462022, India ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            PoppinsAddText(
                              text: "Thu 21 Apr",
                              fontSize: 12,
                              textAlign: TextAlign.start,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            );
          }),
    );
  }
}
