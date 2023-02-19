import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';

class SimpananFooter extends StatelessWidget {
  const SimpananFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: AppButton(
        text: "Lanjutkan",
        onPressed: () {
          Get.toNamed('/detail-simpanan');
        },
      ),
    );
  }
}
