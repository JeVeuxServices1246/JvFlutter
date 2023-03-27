import 'package:get/get.dart';
import 'package:jv_app/app/modules/user/auth/signup/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController(), fenix: true);
  }
}
