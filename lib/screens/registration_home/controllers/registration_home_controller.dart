import 'package:get/get.dart';

class RegistrationHomeController extends GetxController {
  var completedScreens = 0.obs;

  bool shouldShowBackButton() => !(completedScreens.value == 0);

  void backPressed() {
    if (completedScreens.value >= 0) {
      completedScreens.value--;
    }
  }

  void nextPressed() {
    if (completedScreens.value < 4) {
      completedScreens.value++;
    }
  }
}
