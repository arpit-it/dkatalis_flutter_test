import 'package:flutter/material.dart';

class RegistrationScreenCounter extends StatelessWidget {
  const RegistrationScreenCounter(
      {Key? key, required this.completedScreensCount})
      : super(key: key);

  final int completedScreensCount;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getScreenCountContainer(1, completedScreensCount >= 1),
        getScreenCountConnector(screenWidth),
        getScreenCountContainer(2, completedScreensCount >= 2),
        getScreenCountConnector(screenWidth),
        getScreenCountContainer(3, completedScreensCount >= 3),
        getScreenCountConnector(screenWidth),
        getScreenCountContainer(4, completedScreensCount >= 4),
      ],
    );
  }

  double connectorWidth(double screenWidth) {
    if (screenWidth > 0) {
      return (screenWidth - 200 - 40) / 3;
    }
    return 0.0;
  }

  Widget getScreenCountConnector(double screenWidth) {
    return Container(
      height: 2,
      width: connectorWidth(screenWidth),
      color: Colors.black,
    );
  }

  Widget getScreenCountContainer(int screenCount, bool isScreenComplete) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: isScreenComplete ? Colors.green : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(
          width: 2,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Text(
          '$screenCount',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
