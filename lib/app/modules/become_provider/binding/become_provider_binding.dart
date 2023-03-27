import 'package:get/get.dart';
import 'package:jv_app/app/modules/become_provider/controllers/become_provider_controller.dart';

class BecomeProviderBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BecomeProviderController());
  }

}