import 'package:dkatalis_demo/screens/registration_home/controllers/registration_home_controller.dart';
import 'package:dkatalis_demo/utilities/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPassword extends StatelessWidget {
  RegistrationPassword({Key? key}) : super(key: key);

  final RegistrationHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Password will be used to login to account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(() {
              return TextField(
                onChanged: controller.onPasswordTextChange,
                obscureText: controller.obscurePassword.value,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Create Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: controller.obscurePassword.value
                          ? ProjectColors.BACKGROUND_BLUE
                          : ProjectColors.SCREEN_COUNTER_COMPLETE,
                    ),
                    onPressed: controller.toggleObscureText,
                  ),
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Obx(
              () {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Complexity:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          controller.complexityLevel.value,
                          style: TextStyle(
                              color: controller.complexityTextColor.value,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            !controller.containsLowerCase.value
                                ? Text(
                                    'a',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  )
                                : getTickContainer(),
                            SizedBox(height: 10),
                            Text(
                              'Lowercase',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            !controller.containsUpperCase.value
                                ? Text(
                                    'A',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  )
                                : getTickContainer(),
                            SizedBox(height: 10),
                            Text(
                              'Uppercase',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            !controller.containsNumbers.value
                                ? Text(
                                    '123',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  )
                                : getTickContainer(),
                            SizedBox(height: 10),
                            Text(
                              'Number',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            !controller.hasRequiredLength.value
                                ? Text(
                                    '9+',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  )
                                : getTickContainer(),
                            SizedBox(height: 10),
                            Text(
                              'Characters',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getTickContainer() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: ProjectColors.SCREEN_COUNTER_COMPLETE,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Icon(
          Icons.check,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
