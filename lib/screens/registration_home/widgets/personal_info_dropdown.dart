import 'package:flutter/material.dart';

class PersonalInfoDropdown<String> extends StatelessWidget {
  late final List<DropdownMenuItem<String>> dropdownMenuItemList;
  final ValueChanged<String?>? onChanged;
  final String? value;
  final String title;
  final bool isEnabled;

  PersonalInfoDropdown.fromListOfStrings({
    Key? key,
    required this.title,
    required List<String> list,
    required this.onChanged,
    this.value,
    this.isEnabled = true,
  }) {
    List<DropdownMenuItem<String>> items = [];
    for (var item in list) {
      items.add(DropdownMenuItem(
        value: item,
        child: Text('$item'),
      ));
    }
    dropdownMenuItemList = items.cast<DropdownMenuItem<String>>();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            color: isEnabled ? Colors.white : Colors.grey.withAlpha(100)),
        child: SizedBox(
          height: 75,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '$title',
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Container(),
                      style: TextStyle(
                          fontSize: 20.0,
                          color: isEnabled ? Colors.black : Colors.grey[700]),
                      items: dropdownMenuItemList,
                      hint: Text('- Choose Option -'),
                      onChanged: onChanged,
                      value: value,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
