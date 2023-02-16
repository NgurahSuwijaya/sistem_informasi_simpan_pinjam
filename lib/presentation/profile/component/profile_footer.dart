import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';

class ProfileFooter extends StatelessWidget {
  const ProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: "Edit Profile",
      onPressed: () {
        Get.toNamed('/edit-profile');
      },
    );
  }
}
