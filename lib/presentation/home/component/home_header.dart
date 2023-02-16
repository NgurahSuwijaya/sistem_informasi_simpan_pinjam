import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.blackComponent,
            backgroundImage: NetworkImage(
                'https://cdn.discordapp.com/attachments/856786757516918784/1057564396194373632/Screenshot_20221228_154104_WhatsApp.jpg'),
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo Aris',
                style: AppFont.h2,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Semoga Harimu Menyenangkan',
                style: AppFont.subtitle1,
              ),
            ],
          ),
        ],
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.bell_fill,
            color: AppColor.gray4,
          ))
    ]);
  }
}
