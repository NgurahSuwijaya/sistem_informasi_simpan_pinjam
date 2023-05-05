import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/controllers/home.controller.dart';

class HomeContent extends StatelessWidget {
  final HomeController homeController;
  const HomeContent({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Card(
          // margin: EdgeInsets.all(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          // color: AppColor.green1,
          shadowColor: Colors.blueGrey,
          elevation: 3,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                    image: NetworkImage(
                        "https://cdn.discordapp.com/attachments/856786757516918784/1057995446095712276/Group_54.jpg"))),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Saldo Simpanan",
                    style: AppFont.title1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Rp",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx((() => Text(
                            homeController.simpananData.value.saldo.toString(),
                            style: const TextStyle(
                                color: AppColor.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          )))
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx((() => Text(
                            homeController
                                .simpananData.value.member.nomorIndukAnggota,
                            style: AppFont.subtitle1,
                          ))),
                      Obx((() => Text(
                            homeController.simpananData.value.member.user
                                .institutions.name,
                            style: AppFont.subtitle1,
                          ))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
