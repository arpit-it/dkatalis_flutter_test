import 'package:dkatalis_demo/utilities/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/registration_home_controller.dart';
import 'widgets/registration_screen_counter.dart';
import 'widgets/registration_home_back_button.dart';

class RegistrationHome extends GetView<RegistrationHomeController> {
  @override
  Widget build(context) => Scaffold(
        backgroundColor: ProjectColors.BACKGROUND_BLUE,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Obx(
                  () => Column(
                    children: [
                      RegistrationHomeBackButton(
                        shouldShowBackButton: controller.shouldShowBackButton(),
                        onPressed: controller.backPressed,
                      ),
                      RegistrationScreenCounter(
                        completedScreensCount:
                            controller.completedScreens.value,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: SizedBox.expand(
                  child: Center(
                    child: Text('Center Body'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox.expand(
                  child: Center(
                    child: ElevatedButton(
                      child: Text('Next'),
                      onPressed: controller.nextPressed,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // <-- Radius
                        ),
                        primary: ProjectColors.BUTTON_COLOR_BLUE,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            vertical: 18),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
