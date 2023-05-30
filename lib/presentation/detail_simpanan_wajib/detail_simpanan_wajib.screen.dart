import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';

import '../../domain/entities/response_bank.dart';
import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_simpanan_wajib.controller.dart';

class DetailSimpananWajibScreen extends GetView<DetailSimpananWajibController> {
  const DetailSimpananWajibScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final ResponseTagihanSimpanan responseTagihanSimpanan = argument[0];
    final int jumlah = argument[1];
    final Bank bank = argument[2];
    final File buktiBayar = File(argument[3]);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Simpanan Wajib'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "Detail Pembayaran Angsuran",
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
                              bottom:
                                  BorderSide(width: 1.0, color: AppColor.gray5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              DateFormat('dd MMMM yyyy', 'id_ID')
                                  .format(DateTime.now())
                                  .toString(),
                              style: AppFont.title1,
                            ),
                          )),
                      Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: AppColor.gray5),
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
                                  height: 10,
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
                                      bank.namaBank,
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
                                      "Nomor Rekening",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      bank.nomorRekening,
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
                              bottom:
                                  BorderSide(width: 1.0, color: AppColor.gray5),
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
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Jenis Simpanan",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      'Simpanan Wajib',
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
                              bottom:
                                  BorderSide(width: 1.0, color: AppColor.gray5),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Tagihan Simpanan",
                                        style: AppFont.title3,
                                      ),
                                      Text(
                                        NumberFormat.currency(
                                                symbol: 'Rp',
                                                decimalDigits: 0,
                                                locale: 'id_ID')
                                            .format(jumlah),
                                        style: AppFont.title43,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ))),
                      Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.0, color: AppColor.gray5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bukti Pembayaran",
                                  style: AppFont.title1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "bukti_bayar.jpg",
                                      style: AppFont.title2,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.previewImage(buktiBayar);
                                      },
                                      icon: const Icon(Icons.image_search),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  text: "Bayar",
                  onPressed: () {
                    controller.postBayarTagihanSimpananWajib(
                        jumlah, bank, buktiBayar);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                AppButton(
                  text: "Kembali",
                  color: AppColor.sRed,
                  onPressed: () {
                    Get.back();
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )),
        ));
  }
}
