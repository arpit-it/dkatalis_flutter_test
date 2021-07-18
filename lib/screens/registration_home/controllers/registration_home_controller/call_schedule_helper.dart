import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallScheduleHelper {
  Rx<DateTime?> selectedDate = Rx(null);
  void onDateSelected(DateTime? date) {
    selectedDate.value = date;
  }

  Rx<TimeOfDay?> selectedTime = Rx(null);
  void onTimeSelected(TimeOfDay? time) {
    selectedTime.value = time;
  }

  bool isCallScheduleValid() {
    return selectedTime.value != null && selectedDate.value != null;
  }
}
