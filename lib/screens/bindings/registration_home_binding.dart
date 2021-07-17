import 'package:dkatalis_demo/screens/controllers/registration_home_controller.dart';
import 'package:get/get.dart';

class RegistrationHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationHomeController());
  }
}
