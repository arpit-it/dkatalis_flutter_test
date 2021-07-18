import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VCDatePicker extends StatelessWidget {
  const VCDatePicker(
      {Key? key, required this.selectedDate, required this.onDateChanged})
      : super(key: key);
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;
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
        onTap: () => _selectDate(context),
        child: SizedBox(
          height: 60,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    _getReadableDate(),
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

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return _buildCupertinoDatePicker(context);
    }
  }

  _buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null && picked != selectedDate) {
      onDateChanged(picked);
    }
  }

  _buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != selectedDate) {
                  onDateChanged(picked);
                }
              },
              initialDateTime:
                  selectedDate ?? DateTime.now().add(Duration(days: 1)),
              minimumDate: DateTime.now().add(Duration(days: 1)),
              maximumDate: DateTime.now().add(Duration(days: 30)),
            ),
          );
        });
  }

  String _getReadableDate() {
    if (selectedDate != null) {
      return '${getWeekDay(selectedDate!.weekday)}, ${selectedDate!.day} ${getMonth(selectedDate!.month)} ${selectedDate!.year}';
    }
    return '- Choose Date -';
  }

  String getWeekDay(int weekDay) {
    print(weekDay);
    switch (weekDay) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
    }
    return '';
  }

  String getMonth(int month) {
    print(month);
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return '';
  }
}
