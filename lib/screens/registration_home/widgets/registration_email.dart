import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/registration_home_controller/registration_home_controller.dart';
import '../../../utilities/project_colors.dart';
import '../../../utilities/string_extensions.dart';

class RegistrationEmail extends StatelessWidget {
  RegistrationEmail({Key? key}) : super(key: key);

  final RegistrationHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: ClipPath(
              clipper: CustomBackground(),
              child: Container(
                color: ProjectColors.BACKGROUND_BLUE,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'GIN',
                        ),
                        TextSpan(
                          text: ' Finans',
                          style:
                              TextStyle(color: ProjectColors.BACKGROUND_BLUE),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome to The Bank of The Future.\nManage and track your accounts on the go.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: controller.emailScreenHelper.emailFormKey,
                    child: TextFormField(
                      controller: controller.emailScreenHelper.emailTEC,
                      obscureText: false,
                      validator: (string) {
                        if (string == null || string.trim().isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!string.isValidEmail()) {
                          return 'Enter valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double pi = 22 / 7;
    Path path = Path()
      ..lineTo(0, 120)
      ..arcTo(Rect.fromLTWH(0, 0, 110, 100), 1 * pi, 0.5 * pi, false)
      ..quadraticBezierTo(120, 0, size.width, 100)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
