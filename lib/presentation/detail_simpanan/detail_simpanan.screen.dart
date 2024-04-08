import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/response_bank.dart';
import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_simpanan.controller.dart';

class DetailSimpananScreen extends GetView<DetailSimpananController> {
  const DetailSimpananScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal());
    final arg = Get.arguments;
    final isSetoran = arg[0] as bool;
    final jenisRekeningSimpnan = arg[1] as String;
    final jumlahSimpanan = arg[2] as int;
    Bank? bankSimpanan;
    File? buktiBayar = File('');
    String namaBank = "";
    String nomRek = "";
    if (isSetoran) {
      bankSimpanan = arg[3] as Bank?;
      namaBank = bankSimpanan!.namaBank;
      nomRek = bankSimpanan.nomorRekening;
      buktiBayar = File(arg[4]);
    }

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
                                formattedDate,
                                style: AppFont.title1,
                              ),
                            )),
                        if (isSetoran)
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
                                        //  Obx((() => Text(
                                        //       // controller
                                        //       //     .bankSimpanan.value!.namaBank,

                                        //       style: AppFont.title2,
                                        //     ))),
                                        Text(
                                          // controller
                                          //     .bankSimpanan.value!.namaBank,
                                          namaBank,
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
                                        // Obx((() => Text(
                                        //       // controller.bankSimpanan.value!
                                        //       //     .nomorRekening,

                                        //       style: AppFont.title2,
                                        //     ))),
                                        Text(
                                          // controller.bankSimpanan.value!
                                          //     .nomorRekening,
                                          nomRek,
                                          style: AppFont.title2,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        else
                          const Text(""),
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
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Jenis Transaksi",
                                        style: AppFont.title3,
                                      ),
                                      if (isSetoran)
                                        Text(
                                          // controller
                                          //     .jenisSimpanan.value!.name,
                                          'Setoran',
                                          style: AppFont.title2,
                                        )
                                      else
                                        Text(
                                          // controller
                                          //     .jenisSimpanan.value!.name,
                                          'Penarikan',
                                          style: AppFont.title2,
                                        )
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
                                        "Rekening Simpanan",
                                        style: AppFont.title3,
                                      ),
                                      //  Obx((() => Text(
                                      //       // controller
                                      //       //     .jenisRekeningSimpnan.value,
                                      //       style: AppFont.title2,
                                      //     ))),
                                      Text(
                                        // controller
                                        //     .jenisRekeningSimpnan.value,
                                        jenisRekeningSimpnan,
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
                                        // controller.jumlahSimpanan.value
                                        //     .toString(),
                                        NumberFormat.currency(
                                                symbol: 'Rp',
                                                decimalDigits: 0,
                                                locale: 'id_ID')
                                            .format(jumlahSimpanan),
                                        style: AppFont.title4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        if (isSetoran)
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
                              ))
                        else
                          const Text('')
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(
                      text: "Simpan",
                      onPressed: () {
                        controller.postSimpananOnline2(
                            isSetoran,
                            jenisRekeningSimpnan,
                            jumlahSimpanan,
                            bankSimpanan,
                            buktiBayar);
                      }),
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
                ],
              ),
            ),
          ),
        ));
  }
}
