import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../infrastructure/theme/app_color.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

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
        const Text(
          "1905551104",
          style: TextStyle(
              color: AppColor.green1,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
