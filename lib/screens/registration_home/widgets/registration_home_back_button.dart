import 'package:flutter/material.dart';

class RegistrationHomeBackButton extends StatelessWidget {
  const RegistrationHomeBackButton(
      {Key? key, required this.shouldShowBackButton, this.onPressedHandler})
      : super(key: key);
  final VoidCallback? onPressedHandler;
  final bool shouldShowBackButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: 45,
        child: shouldShowBackButton
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        onPressedHandler!();
                      },
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
