import 'package:dkatalis_demo/screens/controllers/registration_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationHome extends GetView<RegistrationHomeController> {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Obx(() => Text("${controller.counter}")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ));
}
