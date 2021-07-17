import 'package:dkatalis_demo/utilities/project_colors.dart';
import 'package:flutter/material.dart';

class RegistrationEmail extends StatelessWidget {
  const RegistrationEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
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
                      style: TextStyle(color: ProjectColors.BACKGROUND_BLUE),
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
              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              )
            ],
          ),
        ),
      ],
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
