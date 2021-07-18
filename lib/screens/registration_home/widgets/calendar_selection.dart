import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'vc_date_picker.dart';
import 'calendar_animation.dart';
import 'vc_time_picker.dart';
import '../controllers/registration_home_controller/registration_home_controller.dart';

class VideoCallScheduler extends StatelessWidget {
  VideoCallScheduler({Key? key}) : super(key: key);

  final RegistrationHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarIconAnimation(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Schedule Video Call',
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
              'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Obx(() {
              return VCDatePicker(
                selectedDate: controller.callScheduleHelper.selectedDate.value,
                onDateChanged: controller.callScheduleHelper.onDateSelected,
              );
            }),
            SizedBox(
              height: 30,
            ),
            Obx(() {
              return VCTimePicker(
                  selectedTime:
                      controller.callScheduleHelper.selectedTime.value,
                  onTimeChanged: controller.callScheduleHelper.onTimeSelected);
            })
          ],
        ),
      ),
    );
  }
}
