import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dkatalis_demo/utilities/string_extensions.dart';

class RegistrationHomeController extends GetxController {
  var completedScreens = 0.obs;

  bool shouldShowBackButton() => !(completedScreens.value == 0);
  PageController viewPagerController = PageController();

  final emailFormKey = GlobalKey<FormState>();
  final emailTEC = TextEditingController();

  RxString complexityLevel = RxString('');
  Rx<Color> complexityTextColor = Rx(Colors.red);
  RxBool containsLowerCase = RxBool(false);
  RxBool containsUpperCase = RxBool(false);
  RxBool containsNumbers = RxBool(false);
  RxBool hasRequiredLength = RxBool(false);
  RxBool obscurePassword = RxBool(true);

  bool isPasswordAcceptable = false;

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
          if (emailFormKey.currentState!.validate()) {
            isScreenValid = true;
          }
          break;
        }
      case 1:
        {
          if (isPasswordAcceptable) {
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

  void toggleObscureText() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onPasswordTextChange(String? string) {
    if (string != null && string.trim().isNotEmpty) {
      print(string);
      updatePasswordRequirement(string);
      updatePasswordComplexity();
    } else {
      containsLowerCase.value = false;
      containsUpperCase.value = false;
      containsNumbers.value = false;
      hasRequiredLength.value = false;
      complexityLevel.value = 'No Password';
      complexityTextColor.value = Colors.red;
      isPasswordAcceptable = false;
    }
  }

  void updatePasswordComplexity() {
    isPasswordAcceptable = false;
    int criteriaMatched = 0;
    if (containsLowerCase.value) {
      criteriaMatched++;
    }
    if (containsUpperCase.value) {
      criteriaMatched++;
    }
    if (containsNumbers.value) {
      criteriaMatched++;
    }
    if (hasRequiredLength.value) {
      criteriaMatched++;
    }
    switch (criteriaMatched) {
      case 0:
        {
          complexityLevel.value = 'No Password';
          complexityTextColor.value = Colors.red;
          return;
        }
      case 1:
        {
          complexityLevel.value = 'Very Weak';
          complexityTextColor.value = Colors.deepOrange;
          return;
        }
      case 2:
        {
          complexityLevel.value = 'Weak';
          complexityTextColor.value = Colors.orange;
          return;
        }
      case 3:
        {
          complexityLevel.value = 'Medium';
          complexityTextColor.value = Colors.yellow;
          return;
        }
      case 4:
        {
          complexityLevel.value = 'Strong';
          complexityTextColor.value = Colors.green;
          isPasswordAcceptable = true;
          return;
        }
    }
  }

  void updatePasswordRequirement(String string) {
    containsLowerCase.value = string.containsLowerCase();
    containsUpperCase.value = string.containsUpperCase();
    containsNumbers.value = string.containsNumbers();
    hasRequiredLength.value = string.length > 9;
  }
}
