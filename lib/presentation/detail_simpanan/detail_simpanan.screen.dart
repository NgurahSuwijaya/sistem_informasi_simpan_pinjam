import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_simpanan.controller.dart';

class DetailSimpananScreen extends GetView<DetailSimpananController> {
  const DetailSimpananScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Simpanan'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "Detail Simpanan",
                          style: AppFont.title1,
                        ),
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
                      child: Column(children: [
                        Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: AppColor.gray5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                "11/02/2023",
                                style: AppFont.title1,
                              ),
                            )),
                        Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: AppColor.gray5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tujuan Pembayaran',
                                    style: AppFont.title1,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Bank",
                                        style: AppFont.title3,
                                      ),
                                      Text(
                                        "BPD BALI",
                                        style: AppFont.title2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "No Rekening",
                                        style: AppFont.title3,
                                      ),
                                      Text(
                                        "7720828094",
                                        style: AppFont.title2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: AppColor.gray5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Keterangan Simpanan',
                                    style: AppFont.title1,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Jenis Transaksi",
                                        style: AppFont.title3,
                                      ),
                                      Text(
                                        "Simpanan Wajib",
                                        style: AppFont.title2,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Jumlah",
                                        style: AppFont.title3,
                                      ),
                                      Text(
                                        "Rp 1,000,0000,000",
                                        style: AppFont.title2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: AppColor.gray5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Informasi Pinjaman Aktif",
                                    style: AppFont.title1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "screenshoot.jpg",
                                    style: AppFont.title2,
                                  )
                                ],
                              ),
                            )),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppButton(
                    text: "Simpan",
                    onPressed: () {
                      Get.toNamed('/detail-simpanan');
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppButton(
                    text: "Kembali",
                    color: AppColor.sRed,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
