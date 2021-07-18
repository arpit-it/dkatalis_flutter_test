import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'email_helper.dart';
import 'password_helper.dart';
import 'personal_info_helper.dart';
import 'call_schedule_helper.dart';

class RegistrationHomeController extends GetxController {
  var completedScreens = 0.obs;
  PageController viewPagerController = PageController();

  EmailHelper emailScreenHelper = new EmailHelper();
  PasswordHelper passwordScreenHelper = new PasswordHelper();
  PersonalInfoHelper personalInfoHelper = new PersonalInfoHelper();
  CallScheduleHelper callScheduleHelper = new CallScheduleHelper();

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
      case 2:
        {
          if (personalInfoHelper.isPersonalInfoScreenValid()) {
            isScreenValid = true;
          } else {
            Get.snackbar('All Information Required',
                'Please choose options for all fields.',
                colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
          }
          break;
        }
      case 3:
        {
          if (callScheduleHelper.isCallScheduleValid()) {
            isScreenValid = true;
          } else {
            Get.snackbar('Date and Time required',
                'Please select date and time so that we can schedule a call.',
                colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
          }
          break;
        }
    }
    if (isScreenValid && completedScreens.value < 3) {
      completedScreens.value++;
      viewPagerController.animateToPage(completedScreens.value,
          duration: Duration(milliseconds: 500), curve: Curves.easeInExpo);
    } else if (isScreenValid && completedScreens.value == 3) {
      // all screens are valid
      completedScreens.value++;
      Get.defaultDialog(
        onWillPop: () async {
          return false;
        },
        title: 'Registration Successful',
        middleText:
            'Thank you for showing interest in our bank. We have emailed you the account info and call details. Our executive will call you on the time you have provided.',
        textConfirm: "OK",
        barrierDismissible: false,
        onConfirm: () {
          Get.back();
          completedScreens.value--;
        },
      );
    }
  }
}
