import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_card_button.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppCardButton(
                        icon: Icon(CupertinoIcons.book_fill),
                        color: AppColor.sPurple,
                        onPressed: () {},
                      ),
                      Text(
                        "Simpanan",
                        style: AppFont.subtitle3,
                      ),
                      Text(
                        "Online",
                        style: AppFont.subtitle3,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: Icon(CupertinoIcons.money_dollar),
                        color: AppColor.sYellow,
                        onPressed: () {},
                      ),
                      Text(
                        "Informasi",
                        style: AppFont.subtitle3,
                      ),
                      Text(
                        "Pinjaman",
                        style: AppFont.subtitle3,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: Icon(CupertinoIcons.calendar_today),
                        color: AppColor.sBlue,
                        onPressed: () {},
                      ),
                      Text(
                        "Angsuran",
                        style: AppFont.subtitle3,
                      ),
                      Text(
                        "Online",
                        style: AppFont.subtitle3,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: Icon(CupertinoIcons.plus_app_fill),
                        color: AppColor.sRed,
                        onPressed: () {},
                      ),
                      Text(
                        "Pengajuan",
                        style: AppFont.subtitle3,
                      ),
                      Text(
                        "Pinjaman",
                        style: AppFont.subtitle3,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      AppCardButton(
                        icon: Icon(CupertinoIcons.clock_fill),
                        color: AppColor.sBlue,
                        onPressed: () {},
                      ),
                      Text(
                        "Mutasi",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: Icon(CupertinoIcons.bell),
                        color: AppColor.sRed,
                        onPressed: () {},
                      ),
                      Text(
                        "Notifikasi",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 23,
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: Icon(CupertinoIcons.person_fill),
                        color: AppColor.gray2,
                        onPressed: () {},
                      ),
                      Text(
                        "Profil",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
