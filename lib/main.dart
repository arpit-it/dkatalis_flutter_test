import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'screens/registration_home/bindings/registration_home_binding.dart';
import 'screens/registration_home/registration_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(GetMaterialApp(
      initialRoute: '/registration_home',
      getPages: [
        GetPage(
            name: '/registration_home',
            page: () => RegistrationHome(),
            binding: RegistrationHomeBinding()),
      ],
    ));
  });
}
