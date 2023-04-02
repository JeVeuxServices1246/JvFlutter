import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_assets.dart';
import 'package:jv_app/resources/app_theme.dart';
import 'package:jv_app/resources/strings.dart';

class OnBoardongScreen extends StatefulWidget {
  const OnBoardongScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardongScreen> createState() => _OnBoardongScreenState();
}

class _OnBoardongScreenState extends State<OnBoardongScreen> {
  late PageController _pageController;
  final int _numPages = 4;
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 225),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 10.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF191919) : const Color(0xFFCCCCCC),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap:(){
                Get.offAllNamed(MyRouter.onMobileLoginScreen);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 55,
                    decoration: const BoxDecoration(
                      color: Color(0xffB5EBCD),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    child: Text(AppStrings.onBoardingSkipButton,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                // width: MediaQuery.of(context).size.width,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              // color: Colors.blue,
                              child: Image(
                                image: const AssetImage(
                                  AppAssets.onBoardingOne,
                                ),
                                height: 332,
                                fit: BoxFit.scaleDown,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Text(
                              AppStrings.onBoardingTitleOne,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      height: 1.3,
                                      color: Color(0xff635C5C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: const AssetImage(
                              AppAssets.onBoardingTwo,
                            ),
                            height: 332,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Text(
                            AppStrings.onBoardingTitleTwo,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    height: 1.3,
                                    color: Color(0xff635C5C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: const AssetImage(
                              AppAssets.onBoardingThree,
                            ),
                            height: 332,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: AppStrings.onBoardingTitleThree,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      height: 1.3,
                                      color: Color(0xff635C5C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'more',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        height: 1.3,
                                        color: Color(0xff0B6EFE),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: const AssetImage(
                              AppAssets.onBoardingThree,
                            ),
                            height: 332,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Text(
                            AppStrings.onBoardingTitleFour,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    height: 1.3,
                                    color: Color(0xff635C5C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Image(
                    image: const AssetImage(
                      AppAssets.onBoardingLineLeft,
                    ),
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(AppStrings.onBoardingSkipButton,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      )),
                ),
                Expanded(
                  child: Image(
                    image: const AssetImage(
                      AppAssets.onBoardingLineRight,
                    ),
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: _currentPage != _numPages - 1
                    ? Align(
                        alignment: FractionalOffset.center,
                        child: GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Container(
                                child: Image.asset(
                              AppAssets.nextOnBoarding,
                              height: 50,
                              width: 50,
                            ))),
                      )
                    : SizedBox(
                        height: 44,
                        width: 166,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: () {
                            Get.offNamed(MyRouter.onMobileLoginScreen);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Text(AppStrings.onBoardingGetStartButton,
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        )))
          ],
        ),
      ),
    );
  }
}

class CustomIndiactor extends StatelessWidget {
  final bool isActive;

  CustomIndiactor({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 10 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isActive
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class OnboardContent extends StatelessWidget {
  final String image, title, description;

  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width * 10,
          fit: BoxFit.fitWidth,
        ),
        const Spacer(),
        Text(
          title,
          // textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          description,
          // textAlign: TextAlign.center,
          style: const TextStyle(height: 1.5, color: Color(0xff9C9CB4)),
        ),
        const Spacer(),
      ],
    );
  }
}
