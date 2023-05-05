// ignore: implementation_imports
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';

class EditProfileFooter extends StatelessWidget {
  const EditProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          AppButton(
            text: "Simpan",
            onPressed: (() {}),
          ),
          SizedBox(
            height: 10,
          ),
          AppButton(
            onPressed: () {
              Get.back();
            },
            text: "Kembali",
            color: AppColor.sRed,
          )
        ],
      ),
    );
  }
}
