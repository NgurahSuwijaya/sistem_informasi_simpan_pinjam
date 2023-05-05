import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/profile/controllers/profile.controller.dart';

import '../../../infrastructure/theme/app_color.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileController profileController;
  const ProfileHeader({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const CircleAvatar(
          backgroundColor: AppColor.blackComponent,
          backgroundImage: NetworkImage(
              'https://cdn.discordapp.com/attachments/856786757516918784/1057564396194373632/Screenshot_20221228_154104_WhatsApp.jpg'),
          minRadius: 60,
          maxRadius: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          (() =>
              Text(profileController.memberProfileData.value.nomorIndukAnggota,
                  style: const TextStyle(
                    color: AppColor.green1,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ))),
        )
      ],
    );
  }
}
