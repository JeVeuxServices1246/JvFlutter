import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/resources/app_theme.dart';

void main() async {
  await initGetStorage();
  runApp(const MyApp());
  configLoading();
}

Future initGetStorage() async {
  await GetStorage.init();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.1)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          title: 'JEveux',
          debugShowCheckedModeBanner: false,
          getPages: MyRouter.route,
          theme: ThemeData(
              primarySwatch: primaryColorShades, fontFamily: "Roboto"),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
///////////////////////hi Aditi/////////////