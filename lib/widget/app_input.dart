import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';

class AppInput extends StatefulWidget {
  final String hint;
  final String topText;
  final bool canEdit;
  final String? value;
  TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcons;
  final Widget? sufixIcons;
  final TextInputType? textInputType;
  final bool isCurrency;

  AppInput({
    super.key,
    required this.hint,
    required this.topText,
    this.controller,
    required this.obscureText,
    this.prefixIcons,
    this.sufixIcons,
    this.textInputType,
    this.value,
    required this.canEdit,
    required this.isCurrency,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.topText,
              style: AppFont.title1,
            ),
            SizedBox(
              height: 5,
            ),
            if (widget.isCurrency)
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyTextInputFormatter(),
                ],
                readOnly: !widget.canEdit,
                initialValue: widget.value,
                keyboardType: widget.textInputType,
                controller: widget.controller,
                obscureText: widget.obscureText,
                // maxLines: 7,
                // minLines: 1,
                decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: const TextStyle(color: AppColor.gray1),
                    suffixIcon: widget.sufixIcons,
                    prefixIcon: widget.prefixIcons,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColor.gray1))),
              )
            else
              TextFormField(
                readOnly: !widget.canEdit,
                initialValue: widget.value,
                keyboardType: widget.textInputType,
                controller: widget.controller,
                obscureText: widget.obscureText,
                // maxLines: 7,
                // minLines: 1,
                decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: const TextStyle(color: AppColor.gray1),
                    suffixIcon: widget.sufixIcons,
                    prefixIcon: widget.prefixIcons,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: AppColor.gray1))),
              ),
          ],
        ),
      ],
    );
  }
}

class CurrencyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final intCents = int.tryParse(newValue.text) ?? 0;
    final currency =
        NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0);

    final newFormattedValue = currency.format(intCents);
    return newValue.copyWith(
      text: newFormattedValue,
      selection: TextSelection.collapsed(offset: newFormattedValue.length),
    );
  }
}
