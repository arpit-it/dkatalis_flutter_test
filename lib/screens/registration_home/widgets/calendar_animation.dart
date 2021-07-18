import 'package:dkatalis_demo/utilities/project_colors.dart';
import 'package:flutter/material.dart';

class CalendarIconAnimation extends StatefulWidget {
  @override
  _CalendarIconAnimationState createState() => _CalendarIconAnimationState();
}

class _CalendarIconAnimationState extends State<CalendarIconAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: CircleBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0 * animationController.value),
                child: child,
              ),
            );
          },
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {},
              color: ProjectColors.BACKGROUND_BLUE,
              icon: Icon(Icons.calendar_today, size: 24),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
