import 'package:get/get.dart';
import 'package:jv_app/app/modules/user/auth/signup/controller/new_password_controller.dart';
import 'package:jv_app/app/modules/user/auth/signup/controller/signup_controller.dart';

class NewpassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPasswordController(), fenix: true);
  }
}
