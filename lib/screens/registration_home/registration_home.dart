import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/personal_information.dart';
import 'widgets/registration_password.dart';
import '../../utilities/project_colors.dart';
import 'controllers/registration_home_controller/registration_home_controller.dart';
import 'widgets/calendar_selection.dart';
import 'widgets/registration_email.dart';
import 'widgets/registration_screen_counter.dart';
import 'widgets/registration_home_back_button.dart';

class RegistrationHome extends GetView<RegistrationHomeController> {
  @override
  Widget build(context) => WillPopScope(
        onWillPop: () async {
          controller.backPressed();
          return false;
        },
        child: GestureDetector(
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
                                onPressedHandler: controller.backPressed,
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
                                  return RegistrationPassword();
                                case 2:
                                  return PersonalInformation();
                                case 3:
                                  return VideoCallScheduler();
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
        ),
      );
}
