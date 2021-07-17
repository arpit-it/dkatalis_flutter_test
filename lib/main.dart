import 'package:dkatalis_demo/screens/registration_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/bindings/registration_home_binding.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/registration_home',
    getPages: [
      GetPage(
          name: '/registration_home',
          page: () => RegistrationHome(),
          binding: RegistrationHomeBinding()),
    ],
  ));
}
