import 'package:get/get.dart';

class RegistrationHomeController extends GetxController {
  var completedScreens = 0.obs;

  bool shouldShowBackButton() => !(completedScreens.value == 0);

  void backPressed() {
    print('back pressed');
  }
}
