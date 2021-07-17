import 'package:dkatalis_demo/screens/registration_home/registration_email/registration_email.dart';
import 'package:dkatalis_demo/utilities/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/registration_home_controller.dart';
import 'widgets/registration_screen_counter.dart';
import 'widgets/registration_home_back_button.dart';

class RegistrationHome extends GetView<RegistrationHomeController> {
  @override
  Widget build(context) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ProjectColors.BACKGROUND_BLUE,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Obx(
                        () => Column(
                          children: [
                            RegistrationHomeBackButton(
                              shouldShowBackButton:
                                  controller.shouldShowBackButton(),
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
                      flex: 24,
                      child: SizedBox.expand(
                        child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller.viewPagerController,
                          itemBuilder: (context, position) {
                            switch (position) {
                              case 0:
                                return RegistrationEmail();
                              case 1:
                                return Container(
                                  color: Colors.cyan,
                                );
                              case 2:
                                return Container(
                                  color: Colors.deepPurple,
                                );
                              case 3:
                                return Container(
                                  color: Colors.orange,
                                );
                              default:
                                return Container(
                                  color: Colors.pink,
                                );
                            }
                          },
                          itemCount: 4, // Can be null
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Next'),
                      onPressed: controller.nextPressed,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
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
              ],
            ),
          ),
        ),
      );
}
