import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../infrastructure/theme/app_color.dart';
import '../infrastructure/theme/app_font.dart';

class AppDropDown extends StatefulWidget {
  final List<String> items;
  final String name;
  AppDropDown({super.key, required this.items, required this.name});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(item, style: AppFont.subtitle1),
                    ],
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        buttonHeight: 60,
        buttonWidth: double.infinity,
        buttonDecoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.7, color: AppColor.gray1),
        ),
        buttonElevation: 0,
        itemHeight: 40,
        itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      ),
    );
  }
}
