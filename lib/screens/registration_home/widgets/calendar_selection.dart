import 'package:dkatalis_demo/screens/registration_home/widgets/vc_date_picker.dart';
import 'package:dkatalis_demo/screens/registration_home/widgets/calendar_animation.dart';
import 'package:dkatalis_demo/screens/registration_home/widgets/vc_time_picker.dart';
import 'package:flutter/material.dart';

class VideoCallScheduler extends StatelessWidget {
  const VideoCallScheduler({Key? key}) : super(key: key);

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
            VCDatePicker(
              selectedDate: null,
              onDateChanged: (date) {
                print(date.toString());
              },
            ),
            SizedBox(
              height: 30,
            ),
            VCTimePicker(
                selectedTime: null,
                onDateChanged: (time) {
                  print(time.toString());
                })
          ],
        ),
      ),
    );
  }
}
