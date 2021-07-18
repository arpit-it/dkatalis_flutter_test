import 'email_helper.dart';
import 'password_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationHomeController extends GetxController {
  var completedScreens = 0.obs;
  PageController viewPagerController = PageController();

  EmailHelper emailScreenHelper = new EmailHelper();
  PasswordHelper passwordScreenHelper = new PasswordHelper();

  bool shouldShowBackButton() => !(completedScreens.value == 0);
  void backPressed() {
    if (completedScreens.value >= 0) {
      completedScreens.value--;
      viewPagerController.animateToPage(completedScreens.value,
          duration: Duration(milliseconds: 500), curve: Curves.easeInExpo);
    }
  }

  void nextPressed() {
    var isScreenValid = false;
    switch (completedScreens.value) {
      case 0:
        {
          if (emailScreenHelper.isEmailScreenValid()) {
            isScreenValid = true;
          }
          break;
        }
      case 1:
        {
          if (passwordScreenHelper.isPasswordScreenValid()) {
            isScreenValid = true;
          } else {
            Get.snackbar('Invalid Password',
                'Password should match all the required criteria.',
                colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
          }
          break;
        }
    }
    if (isScreenValid && completedScreens.value < 3) {
      completedScreens.value++;
      viewPagerController.animateToPage(completedScreens.value,
          duration: Duration(milliseconds: 500), curve: Curves.easeInExpo);
    }
  }
}
