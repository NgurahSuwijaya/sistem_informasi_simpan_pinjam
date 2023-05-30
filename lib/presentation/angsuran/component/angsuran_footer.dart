import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/angsuran/controllers/angsuran.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';

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
