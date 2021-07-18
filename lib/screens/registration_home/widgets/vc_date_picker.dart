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
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
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
              initialDateTime: selectedDate ?? DateTime.now(),
              minimumDate: DateTime.now(),
              maximumDate: DateTime.now().add(Duration(days: 30)),
            ),
          );
        });
  }

  String _getReadableDate() {
    if (selectedDate != null) {
      return '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}';
    }
    return '- Choose Date -';
  }
}
