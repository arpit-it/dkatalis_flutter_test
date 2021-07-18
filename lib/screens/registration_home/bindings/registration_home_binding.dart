import 'package:dkatalis_demo/screens/registration_home/controllers/registration_home_controller/registration_home_controller.dart';
import 'package:get/get.dart';

class RegistrationHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationHomeController());
  }
}
