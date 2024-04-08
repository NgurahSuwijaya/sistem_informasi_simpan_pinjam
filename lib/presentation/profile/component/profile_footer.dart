import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_ok_dialog.dart';
import '../controllers/profile.controller.dart';

class ProfileFooter extends StatelessWidget {
  final ProfileController profileController;
  const ProfileFooter({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      color: AppColor.sBlue,
      text: "Rubah Data Profil ?",
      onPressed: () {
        // Get.toNamed("/edit-profile");
        Get.dialog(AppOkeDialog(
            onPressed: () => Get.back(),
            title: "Pemberitahuan",
            content:
                "Jika ada data profil anggota anda yang salah atau ingin di rubah Anda dapat memberitahukan kepada admin atau pengurus Koperasi untuk melakukan perubahan data"));
        // Get.defaultDialog(
        //     title: "Rubah Data Profil ?",
        //     backgroundColor: AppColor.white,
        //     titleStyle: const TextStyle(
        //         fontWeight: FontWeight.bold, color: AppColor.sBlue),
        //     barrierDismissible: true,
        //     radius: 15,
        //     content: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             children: [
        //               const Text(
        //                 'Jika ada data profil anggota anda yang salah atau ingin di rubah',
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.normal,
        //                     color: AppColor.blackComponent),
        //               ),
        //               const Text(
        //                 'Anda dapat memberitahukan kepada admin atau pengurus Koperasi untuk melakukan perubahan data',
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.normal,
        //                     color: AppColor.blackComponent),
        //               )
        //             ],
        //           ),
        //         ),
        //       ],
        //     ));
      },
    );
  }
}
