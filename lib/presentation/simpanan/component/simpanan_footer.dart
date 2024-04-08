import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/app_button.dart';
import '../controllers/simpanan.controller.dart';

class SimpananFooter extends StatefulWidget {
  final SimpananController controller;
  const SimpananFooter({super.key, required this.controller});

  @override
  State<SimpananFooter> createState() => _SimpananFooterState();
}

class _SimpananFooterState extends State<SimpananFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Obx(
          () => widget.controller.isSetoran.value
              ? AppButton(
                  text: "Lanjutkan",
                  onPressed: widget.controller.getSetoranRequest,
                )
              : AppButton(
                  text: "Lanjutkan",
                  onPressed: widget.controller.getPenarikanRequest,
                ),
        ));
  }
}
