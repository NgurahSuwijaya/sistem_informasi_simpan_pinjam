import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/controllers/home.controller.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_alert_dialog.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_card_button.dart';

class HomeFooter extends StatefulWidget {
  final HomeController homeController;
  const HomeFooter({super.key, required this.homeController});

  @override
  State<HomeFooter> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
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
                          Get.toNamed('/simpanan', arguments: [
                            widget.homeController.saldoAwalGiro.value,
                            widget.homeController.maksPenarikan.value,
                            widget.homeController.giroInstitusi.value,
                            widget.homeController.saldoBiasa.value,
                            widget.homeController.saldoGiro.value,
                          ]);
                        },
                      ),
                      Text(
                        "Simpanan",
                        style: AppFont.subtitle3,
                      ),
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
                          Get.toNamed('/tagihan');
                        },
                      ),
                      Text(
                        "Tagihan",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.calendar_badge_plus),
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
                        icon: const Icon(CupertinoIcons.arrow_right_arrow_left),
                        color: AppColor.sYellow,
                        onPressed: () {
                          Get.toNamed("/transfer", arguments: [
                            widget.homeController.saldoBiasa.value,
                            widget.homeController.simpananData.value.member!
                                .nomorIndukAnggota
                          ]);
                        },
                      ),
                      Text(
                        "Transfer",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.doc_on_doc_fill),
                        color: AppColor.sBlue,
                        onPressed: () {
                          Get.toNamed('/history');
                        },
                      ),
                      Text(
                        "Transaksi",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.mail_solid),
                        color: AppColor.green1,
                        onPressed: () {
                          Get.offNamed('/notification');
                        },
                      ),
                      Text(
                        "Pesan",
                        style: AppFont.subtitle3,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AppCardButton(
                        icon: const Icon(CupertinoIcons.gear_alt_fill),
                        color: AppColor.gray2,
                        onPressed: () {
                          Get.toNamed("/setting", arguments: [
                            widget.homeController.simpananData.value.member!
                                .user.photoPath,
                            widget.homeController.simpananData.value.member!
                                .nomorIndukAnggota,
                            widget.homeController.simpananData.value.member!
                                .user.name,
                            widget.homeController.simpananData.value.member!
                                .kontrolPenarikan,
                            widget.homeController.saldoGiro.value,
                            widget.homeController.simpananData.value.member!
                                .rekeningGiro,
                            widget.homeController.giroInstitusi.value
                          ]);
                        },
                      ),
                      Text(
                        "Pengaturan",
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
