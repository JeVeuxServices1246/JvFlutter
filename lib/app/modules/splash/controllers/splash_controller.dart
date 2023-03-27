import 'package:get/get.dart';
import 'package:jv_app/app/routers/my_router.dart';
import 'package:jv_app/utils/storage/storage_utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _startOnBoarding();
    super.onInit();
  }

  _startOnBoarding() async {
    await Future.delayed(const Duration(seconds: 1));
    if (Storage.isUserExists()) {
      if (Storage.getUser().isUserLogin ?? false) {
        if (Storage.getUser().isProvider ?? false) {
          Get.offAllNamed(MyRouter.pDashboard);
        } else {
          Get.offAllNamed(MyRouter.homeScreen);
        }
      } else {
        Get.offAllNamed(MyRouter.onMobileLoginScreen);
      }
    } else {
      Get.offAllNamed(MyRouter.onBoardingScreen);
    }
  }
}
