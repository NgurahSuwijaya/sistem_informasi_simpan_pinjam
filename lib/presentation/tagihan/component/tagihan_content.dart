import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/tagihan/controllers/tagihan.controller.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';

class TagihanContent extends StatefulWidget {
  TagihanController controller;
  TagihanContent({super.key, required this.controller});

  @override
  State<TagihanContent> createState() => _TagihanContentState();
}

class _TagihanContentState extends State<TagihanContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // color: AppColor.green1,
            shadowColor: Colors.blueGrey,
            elevation: 3,
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text(
                            ("Tagihan "),
                            style: AppFont.title1,
                          ),
                          Text(
                            ("Simpanan "),
                            style: AppFont.title4,
                          ),
                          Text(
                            ("Wajib"),
                            style: AppFont.title1,
                          ),
                        ],
                      ),
                    )),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Obx((() =>
                          widget.controller.isAdaTagihanSimpanan.value
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                        "Anda memiliki tagihan simpanan wajib yang harus dibayar.",
                                        style: AppFont.title3,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      AppButton(
                                        text: 'Bayar',
                                        onPressed: () {
                                          Get.toNamed('/simpanan-wajib',
                                              arguments: widget.controller
                                                  .tagihanSimpanan.value);
                                        },
                                      )
                                    ])
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                        "Anda tidak memiliki tagihan simpanan wajib yang harus dibayar.",
                                        style: AppFont.title3,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      AppButton(
                                        text: 'Bayar',
                                      )
                                    ])))),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            // color: AppColor.green1,
            shadowColor: Colors.blueGrey,
            elevation: 3,
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text(
                            ("Tagihan "),
                            style: AppFont.title1,
                          ),
                          Text(
                            ("Angsuran "),
                            style: AppFont.title43,
                          ),
                          Text(
                            ("Pinjaman"),
                            style: AppFont.title1,
                          ),
                        ],
                      ),
                    )),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Obx((() =>
                          widget.controller.isAdaTagihanAngsuran.value
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                        "Anda memiliki tagihan angsuran yang harus dibayar.",
                                        style: AppFont.title3,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      AppButton(
                                        text: 'Bayar',
                                        color: AppColor.sBlue,
                                        onPressed: () {
                                          Get.toNamed('/angsuran',
                                              arguments: widget.controller
                                                  .tagihanAngsuran.value);
                                        },
                                      )
                                    ])
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                        "Anda tidak memiliki tagihan angsuran yang harus dibayar.",
                                        style: AppFont.title3,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      AppButton(
                                        text: 'Bayar',
                                        color: AppColor.sBlue,
                                      )
                                    ])))),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
