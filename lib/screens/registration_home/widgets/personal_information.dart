import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'personal_info_dropdown.dart';
import '../controllers/registration_home_controller/registration_home_controller.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({Key? key}) : super(key: key);

  final RegistrationHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
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
              'Please fill the following information below and your goal for digital saving.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Obx(() {
              return PersonalInfoDropdown.fromListOfStrings(
                onChanged: controller.personalInfoHelper.onGoalSelected,
                value: controller.personalInfoHelper.selectedGoal.value,
                title: controller.personalInfoHelper.goalDropDownTitle,
                list: controller.personalInfoHelper.goalOptions,
              );
            }),
            SizedBox(
              height: 30,
            ),
            Obx(() {
              return PersonalInfoDropdown.fromListOfStrings(
                onChanged: controller.personalInfoHelper.onIncomeSelected,
                value: controller.personalInfoHelper.selectedIncome.value,
                title: controller.personalInfoHelper.incomeDropDownTitle,
                list: controller.personalInfoHelper.incomeOptions,
              );
            }),
            SizedBox(
              height: 30,
            ),
            Obx(() {
              return PersonalInfoDropdown.fromListOfStrings(
                onChanged: controller.personalInfoHelper.onExpenseSelected,
                value: controller.personalInfoHelper.selectedExpense.value,
                title: controller.personalInfoHelper.expenseDropDownTitle,
                list: controller.personalInfoHelper.expenseOptions,
              );
            }),
          ],
        ),
      ),
    );
  }
}
