import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pengajuan/controllers/pengajuan.controller.dart';

import '../infrastructure/theme/app_color.dart';
import '../infrastructure/theme/app_font.dart';

class AppPengajuanDropDown extends StatefulWidget {
  final List<String> items;
  final PengajuanController controller;
  final String name;
  final String selectedValue;

  const AppPengajuanDropDown(
      {super.key,
      required this.items,
      required this.name,
      required this.controller,
      required this.selectedValue});

  @override
  State<AppPengajuanDropDown> createState() => _AppPengajuanDropDownState();
}

class _AppPengajuanDropDownState extends State<AppPengajuanDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Row(
          children: [
            const SizedBox(
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
                      const SizedBox(
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
          if (widget.name == 'Kategori Pinjaman') {}
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
