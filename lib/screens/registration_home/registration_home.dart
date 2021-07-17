import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/registration_home_controller.dart';
import 'widgets/registration_screen_counter.dart';
import 'widgets/registration_home_back_button.dart';

class RegistrationHome extends GetView<RegistrationHomeController> {
  @override
  Widget build(context) => Scaffold(
        backgroundColor: Colors.blueAccent.shade700,
        body: Column(
          children: [
            RegistrationHomeBackButton(
              shouldShowBackButton: controller.shouldShowBackButton(),
              onPressed: controller.backPressed,
            ),
            RegistrationScreenCounter(
              completedScreensCount: controller.completedScreens.value,
            ),
          ],
        ),
      );
}
