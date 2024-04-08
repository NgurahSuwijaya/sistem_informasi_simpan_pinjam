import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entities/response_tagihan_angsuran.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';
import '../controllers/angsuran.controller.dart';

class AngsuranFooter extends StatefulWidget {
  final AngsuranController controller;
  final ResponseTagihanAngsuran responseTagihanAngsuran;
  const AngsuranFooter(
      {super.key,
      required this.controller,
      required this.responseTagihanAngsuran});

  @override
  State<AngsuranFooter> createState() => _AngsuranFooterState();
}

class _AngsuranFooterState extends State<AngsuranFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: "Lanjutkan",
          onPressed: () {
            widget.controller
                .sendAngsuranDetail(widget.responseTagihanAngsuran);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        AppButton(
          text: "Kembali",
          color: AppColor.sRed,
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
