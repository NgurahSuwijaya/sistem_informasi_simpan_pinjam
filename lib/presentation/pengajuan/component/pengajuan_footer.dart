import 'package:SIMPIN/widget/app_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';
import '../controllers/pengajuan.controller.dart';

class PengajuanFooter extends StatefulWidget {
  final PengajuanController controller;
  const PengajuanFooter({super.key, required this.controller});

  @override
  State<PengajuanFooter> createState() => _PengajuanFooterState();
}

class _PengajuanFooterState extends State<PengajuanFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          AppButton(
            text: 'Lanjutkan',
            onPressed: () {
              widget.controller.getPengajuanRequest();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppButton(
            text: 'Kembali',
            onPressed: () {
              Get.back();
            },
            color: AppColor.sRed,
          )
        ],
      ),
    );
  }
}
