import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';

import '../../domain/entities/response_bank.dart';
import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_angsuran.controller.dart';

class DetailAngsuranScreen extends GetView<DetailAngsuranController> {
  const DetailAngsuranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    final ResponseTagihanAngsuran responseTagihanAngsuran = argument[0];
    final int jumlah = argument[1];
    final Bank bank = argument[2];
    final File buktiBayar = File(argument[3]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Angsuran'),
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
                                  .format(responseTagihanAngsuran
                                      .tagihanAngsuran![0].jatuhTempo)
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
                                  'Keterangan Pembayaran',
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
                                      "Pembayaran Pokok",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(responseTagihanAngsuran
                                              .totalPokok),
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
                                      "Pembayaran Bunga",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(responseTagihanAngsuran
                                              .totalBunga),
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
                                      "Biaya Admin",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(responseTagihanAngsuran
                                              .totalAdmin),
                                      style: AppFont.title42,
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
                                      "Pembayaran Pinalti",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(responseTagihanAngsuran
                                              .totalPenalti),
                                      style: AppFont.title41,
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
                                        "Total Pembayaran",
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
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       "Total Dibayarkan",
                                  //       style: AppFont.title3,
                                  //     ),
                                  //     Row(
                                  //       children: [
                                  //         Text(
                                  //           "Rp",
                                  //           style: AppFont.title4,
                                  //         ),
                                  //         const SizedBox(
                                  //           width: 1,
                                  //         ),
                                  //         Text(
                                  //           '1,000,000',
                                  //           style: AppFont.title4,
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ))),
                      // Container(
                      //     width: double.infinity,
                      //     decoration: const BoxDecoration(
                      //       border: Border(
                      //         bottom:
                      //             BorderSide(width: 1.0, color: AppColor.gray5),
                      //       ),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(25.0),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             "Keterangan Tambahan",
                      //             style: AppFont.title1,
                      //           ),
                      //           SizedBox(
                      //             height: 5,
                      //           ),
                      //           Text(
                      //             "Sisa pembayaran dimasukan ke simpanan",
                      //             style: AppFont.title3,
                      //           ),
                      //         ],
                      //       ),
                      //     )),
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
                    controller.postBayarAngsuran(
                        responseTagihanAngsuran: responseTagihanAngsuran,
                        jumlah: jumlah,
                        buktiBayar: buktiBayar.path);
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
          ),
        ),
      ),
    );
  }
}
