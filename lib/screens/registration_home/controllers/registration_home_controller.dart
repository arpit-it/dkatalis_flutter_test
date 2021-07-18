import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationHomeController extends GetxController {
  var completedScreens = 0.obs;

  bool shouldShowBackButton() => !(completedScreens.value == 0);
  PageController viewPagerController = PageController();

  void backPressed() {
    if (completedScreens.value >= 0) {
      completedScreens.value--;
      viewPagerController.animateToPage(completedScreens.value,
          duration: Duration(milliseconds: 500), curve: Curves.easeInExpo);
    }
  }

  void nextPressed() {
    if (completedScreens.value < 3) {
      completedScreens.value++;
      viewPagerController.animateToPage(completedScreens.value,
          duration: Duration(milliseconds: 500), curve: Curves.easeInExpo);
    }
  }
}
