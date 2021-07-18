import 'package:dkatalis_demo/screens/registration_home/widgets/personal_info_dropdown.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

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
            PersonalInfoDropdown.fromListOfStrings(
              onChanged: (item) {
                print(item);
              },
              title: 'Goal for activation',
              list: ['String1', 'Strng2', 'String3'],
            ),
            SizedBox(
              height: 30,
            ),
            PersonalInfoDropdown.fromListOfStrings(
              onChanged: (item) {
                print(item);
              },
              title: 'Monthly Income',
              list: ['String1', 'Strng2', 'String3'],
            ),
            SizedBox(
              height: 30,
            ),
            PersonalInfoDropdown.fromListOfStrings(
              onChanged: (item) {
                print(item);
              },
              title: 'Monthly expense',
              list: ['String1', 'Strng2', 'String3'],
            ),
          ],
        ),
      ),
    );
  }
}
