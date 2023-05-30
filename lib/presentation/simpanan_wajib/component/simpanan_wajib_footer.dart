import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan_wajib/controllers/simpanan_wajib.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';

class SimpananWajibFooter extends StatefulWidget {
  final SimpananWajibController controller;
  final ResponseTagihanSimpanan responseTagihanSimpanan;
  const SimpananWajibFooter(
      {super.key,
      required this.controller,
      required this.responseTagihanSimpanan});

  @override
  State<SimpananWajibFooter> createState() => _SimpananWajibFooterState();
}

class _SimpananWajibFooterState extends State<SimpananWajibFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: "Lanjutkan",
          onPressed: () {
            widget.controller
                .sendSimpananDetail(widget.responseTagihanSimpanan);
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
