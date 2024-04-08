import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';

class EditProfileFooter extends StatelessWidget {
  const EditProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          AppButton(
            text: "Simpan",
            onPressed: (() {}),
          ),
          const SizedBox(
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
