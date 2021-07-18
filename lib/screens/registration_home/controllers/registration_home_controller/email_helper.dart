import 'package:flutter/material.dart';

class EmailHelper {
  final emailFormKey = GlobalKey<FormState>();
  final emailTEC = TextEditingController();

  bool isEmailScreenValid() {
    return emailFormKey.currentState!.validate();
  }
}
