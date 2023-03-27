import 'package:get/get.dart';
import 'package:jv_app/app/modules/user/home/controllers/main_home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}