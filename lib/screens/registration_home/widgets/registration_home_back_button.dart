import 'package:flutter/material.dart';

class RegistrationHomeBackButton extends StatelessWidget {
  const RegistrationHomeBackButton(
      {Key? key, required this.shouldShowBackButton, this.onPressed})
      : super(key: key);
  final VoidCallback? onPressed;
  final bool shouldShowBackButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: SizedBox(
        height: 50,
        child: shouldShowBackButton
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}
