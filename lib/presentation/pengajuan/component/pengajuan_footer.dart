import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pengajuan/controllers/pengajuan.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';

class PengajuanFooter extends StatelessWidget {
  final PengajuanController controller;
  const PengajuanFooter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          AppButton(
            text: 'Lanjutkan',
            onPressed: () {
              controller.getPengajuanRequest();
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
