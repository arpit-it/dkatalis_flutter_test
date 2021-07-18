import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VCTimePicker extends StatelessWidget {
  const VCTimePicker(
      {Key? key, required this.selectedTime, required this.onTimeChanged})
      : super(key: key);
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onTimeChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () => _selectTime(context),
        child: SizedBox(
          height: 60,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    _getReadableTime(context),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ??
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
    );
    if (newTime != null) {
      onTimeChanged(newTime);
    }
  }

  String _getReadableTime(BuildContext context) {
    if (selectedTime != null) {
      return '${selectedTime!.format(context)}';
    }
    return '- Choose Time -';
  }
}
