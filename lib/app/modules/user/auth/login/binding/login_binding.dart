import 'package:get/get.dart';
import 'package:jv_app/app/modules/user/auth/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
