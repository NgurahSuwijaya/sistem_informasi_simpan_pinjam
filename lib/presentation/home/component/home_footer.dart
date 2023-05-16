import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/controllers/home.controller.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_card_button.dart';

class HomeFooter extends StatelessWidget {
  final HomeController homeController;
  const HomeFooter({super.key, required this.homeController});

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
                        icon: const Icon(CupertinoIcons.book_fill),
                        color: AppColor.sPurple,
                        onPressed: () {
                          Get.toNamed('/simpanan',
                              arguments:
                                  homeController.simpananData.value.saldo);
                        },
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
                        icon: const Icon(CupertinoIcons.money_dollar),
                        color: AppColor.sYellow,
                        onPressed: () {
                          Get.toNamed('/pinjaman');
                        },
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
                        icon: const Icon(CupertinoIcons.calendar_today),
                        color: AppColor.sBlue,
                        onPressed: () {
                          Get.toNamed('/angsuran-menetap');
                        },
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
                        icon: const Icon(CupertinoIcons.plus_app_fill),
                        color: AppColor.sRed,
                        onPressed: () {
                          Get.toNamed('/pengajuan');
                        },
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.clock_fill),
                        color: AppColor.sBlue,
                        onPressed: () {
                          Get.toNamed('/notification');
                        },
                      ),
                      Text(
                        "Mutasi",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   width: 23,
                  // ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.bell_fill),
                        color: AppColor.green1,
                        onPressed: () {},
                      ),
                      Text(
                        "Notifikasi",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   width: 23,
                  // ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.person_fill),
                        color: AppColor.gray2,
                        onPressed: () {
                          Get.toNamed("/profile");
                        },
                      ),
                      Text(
                        "Profil",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   width: 23,
                  // ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.arrow_right),
                        color: AppColor.sRed,
                        onPressed: () {
                          Get.toNamed("/profile");
                        },
                      ),
                      Text(
                        "Keluar",
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
