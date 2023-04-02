import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/poppins_common_text.dart';
import 'package:jv_app/resources/strings.dart';
import 'package:jv_app/utils/hive_utils.dart';
import 'package:jv_app/utils/session_key.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';

class AccountUser extends StatefulWidget {
  const AccountUser({Key? key}) : super(key: key);

  @override
  _AccountUserState createState() => _AccountUserState();
}

class _AccountUserState extends State<AccountUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100.10,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            color: Color(0xffF5F5F5),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xffF5C443)),
                      height: 75,
                      width: 75,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(AppAssets.harry),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PoppinsAddText(
                        textAlign: TextAlign.start,
                        text: HiveUtils.getSession<String>(SessionKey.firstName)?? 'User',
                        fontSize: 17,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        HiveUtils.getSession<String>(SessionKey.phonenum) ?? '_',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(MyRouter.editProfileScreen);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffefefef)),
                      margin: const EdgeInsets.only(right: 14),
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      child: badges.Badge(
                        // animationType: BadgeAnimationType.fade,
                        // animationDuration: const Duration(seconds: 1),
                        // position: const BadgePosition(top: -4, end: 2),
                        showBadge: false,
                        child: Image.asset(
                          AppAssets.editIcon,
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(MyRouter.myBookingScreen);
              },
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 25),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(AppAssets.bookingAccount),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: AppStrings.booking,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(AppAssets.forwordAccount),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(MyRouter.manageAddressScreen);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(AppAssets.manageAddressAccount),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: AppStrings.address,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(AppAssets.forwordAccount),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(MyRouter.referEarnScreen);
              },
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(AppAssets.referEarnAccount),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: AppStrings.earn,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(AppAssets.forwordAccount),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(AppAssets.rateUsAccount),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: AppStrings.rateUs,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(AppAssets.forwordAccount),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff000000)),
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(9),
                      child: Image.asset(AppAssets.aboutJEAccount),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: AppStrings.about,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(AppAssets.forwordAccount),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(AppAssets.rateJEAccount),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: AppStrings.rateJe,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(AppAssets.forwordAccount),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(AppAssets.deleteAccount),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const PoppinsAddText(
                    textAlign: TextAlign.start,
                    text: AppStrings.deleteAccount,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                HiveUtils.addSession(SessionKey.isLoggedIn, false);
                HiveUtils.clear();
                Storage.clear();
                Get.offAllNamed(MyRouter.onMobileLoginScreen);
              },
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(AppAssets.logoutAccount),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: AppStrings.logout,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.becomeProvider);
              },
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  children: const [
                    Icon(Icons.verified_user),
                    SizedBox(width: 20),
                    PoppinsAddText(
                      textAlign: TextAlign.start,
                      text: AppStrings.becomeProvider,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ],
                ).paddingOnly(left: 10),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(MyRouter.helpScreen);
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 40, top: 25),
                  child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 4),
                          color: const Color(0xff52B46B)),
                      height: 75,
                      width: 75,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              child: Image.asset(AppAssets.helpAccount),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            const PoppinsAddText(
                              textAlign: TextAlign.start,
                              text: AppStrings.help,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
