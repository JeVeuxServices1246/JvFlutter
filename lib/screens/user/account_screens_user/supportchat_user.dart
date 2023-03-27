import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/screens/user/chat_user/model.dart';

class SupportChatUser extends StatefulWidget {
  const SupportChatUser({Key? key}) : super(key: key);

  @override
  State<SupportChatUser> createState() => _SupportChatUserState();
}

class _SupportChatUserState extends State<SupportChatUser> {
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
              text: "Support Chat",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Stack(
            children: [
              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 100),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 16,
                          bottom: 2,
                          left: messages[index].messageType == "receiver"
                              ? 0
                              : 45,
                          right: messages[index].messageType == "receiver"
                              ? 45
                              : 0,
                        ),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (messages[index].messageType == "receiver"
                                  ? const Color(0xfffF3F3F3)
                                  : const Color(0xffF2EBFF)),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff161616),
                                  fontFamily: popionsRegular),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: const Text(
                          'Today 09:37 am',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: popionsRegular,
                              color: AppColors.lightGreyColor),
                        ),
                      )
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: sendMsgTextField(),
                ),
              )
            ],
          ),
        ));
  }

  sendMsgTextField() {
    return Container(
      height: 47,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffDADADA)),
          borderRadius: BorderRadius.circular(27.5)),
      padding: const EdgeInsets.only(left: 18.52),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
            hintText: 'Send Message',
            hintStyle: const TextStyle(
                color: Color(0xffDADADA),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: popionsMedium),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('assets/icon/send.png'),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
