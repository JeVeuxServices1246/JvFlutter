import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Flexible(
                child: SizedBox(
                    width: deviceWidth * 1,
                    height: deviceHeight * 1,
                    child: Image.asset(
                      AppAssets.splashWhiteBackground,
                      fit: BoxFit.fill,
                    )),
              ),
              Flexible(
                child: SizedBox(
                    width: deviceWidth * 1,
                    height: deviceHeight * 1,
                    child: Image.asset(
                      AppAssets.splashBlackBackground,
                      fit: BoxFit.fill,
                    )),
              )
            ],
          ),
          Positioned(
              top: 30,
              bottom: 30,
              right: 60,
              left: 60,
              child: Image.asset(
                AppAssets.splashLogo,
                height: 300,
                width: 300,
              ))
        ],
      ),
    );
  }
}
