import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_transaksi_angsuran.controller.dart';

class DetailTransaksiAngsuranScreen
    extends GetView<DetailTransaksiAngsuranController> {
  const DetailTransaksiAngsuranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Transaksi Angsuran'),
          centerTitle: true,
        ),
        body: Obx((() => controller.isLoadingData.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "Detail Transaksi",
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
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: AppColor.gray5),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              DateFormat(
                                                      'dd MMMM yyyy', "id_ID")
                                                  .format(controller
                                                      .angsuranSaya
                                                      .value!
                                                      .data!
                                                      .tanggalTransaksi!
                                                      .toLocal()),
                                              style: AppFont.title1,
                                            ),
                                            Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              color: controller
                                                          .angsuranSaya
                                                          .value!
                                                          .data!
                                                          .statusTransaksi ==
                                                      'pending'
                                                  ? AppColor.sYellow
                                                  : controller
                                                              .angsuranSaya
                                                              .value!
                                                              .data!
                                                              .statusTransaksi ==
                                                          'ditolak'
                                                      ? AppColor.sRed
                                                      : controller
                                                                  .angsuranSaya
                                                                  .value!
                                                                  .data!
                                                                  .statusTransaksi ==
                                                              'berjalan'
                                                          ? AppColor.sBlue
                                                          : AppColor.green1,
                                              shadowColor: Colors.blueGrey,
                                              elevation: 1,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4,
                                                        horizontal: 20),
                                                child: Text(
                                                  controller.angsuranSaya.value!
                                                      .data!.statusTransaksi!,
                                                  style: const TextStyle(
                                                      color: AppColor.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: AppColor.gray5),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Keterangan Transaksi',
                                              style: AppFont.title1,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Tipe Transaksi",
                                                  style: AppFont.title3,
                                                ),
                                                Text(
                                                  "Pembayaran angsuran",
                                                  style: AppFont.title2,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Tipe Angsuran",
                                                  style: AppFont.title3,
                                                ),
                                                Text(
                                                  "Tagihan ${controller.angsuranSaya.value!.data!.pinjaman!.tipeAngsuran}",
                                                  style: AppFont.title2,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Tipe Bunga",
                                                  style: AppFont.title3,
                                                ),
                                                Text(
                                                  "Bunga ${controller.angsuranSaya.value!.data!.pinjaman!.tipeBungaPinjaman}",
                                                  style: AppFont.title2,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Metode Transaksi",
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
                                                  controller.angsuranSaya.value!
                                                      .data!.metodeAngsuran!,
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
                                              width: 1.0,
                                              color: AppColor.gray5),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Keterangan Pembayaran',
                                              style: AppFont.title1,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pembayaran Pokok",
                                                  style: AppFont.subtitle1,
                                                ),
                                                Text(
                                                  NumberFormat.currency(
                                                          symbol: 'Rp',
                                                          decimalDigits: 0,
                                                          locale: 'id_ID')
                                                      .format(controller
                                                          .angsuranSaya
                                                          .value!
                                                          .data!
                                                          .pembayaranPokok!),
                                                  style: AppFont.title2,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pembayaran Bunga",
                                                  style: AppFont.subtitle1,
                                                ),
                                                Text(
                                                  NumberFormat.currency(
                                                          symbol: 'Rp',
                                                          decimalDigits: 0,
                                                          locale: 'id_ID')
                                                      .format(controller
                                                          .angsuranSaya
                                                          .value!
                                                          .data!
                                                          .pembayaranBunga!),
                                                  style: AppFont.title2,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pembayaran Admin",
                                                  style: AppFont.subtitle1,
                                                ),
                                                Text(
                                                  // controller.jumlahSimpanan.value
                                                  //     .toString(),
                                                  NumberFormat.currency(
                                                          symbol: 'Rp',
                                                          decimalDigits: 0,
                                                          locale: 'id_ID')
                                                      .format(controller
                                                          .angsuranSaya
                                                          .value!
                                                          .data!
                                                          .pembayaranAdministrasi!),
                                                  style: AppFont.title43,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pembayaran Pinalti",
                                                  style: AppFont.subtitle1,
                                                ),
                                                Text(
                                                  // controller.jumlahSimpanan.value
                                                  //     .toString(),
                                                  NumberFormat.currency(
                                                          symbol: 'Rp',
                                                          decimalDigits: 0,
                                                          locale: 'id_ID')
                                                      .format(controller
                                                          .angsuranSaya
                                                          .value!
                                                          .data!
                                                          .pembayaranPenalti!),
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
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: AppColor.gray5),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total Transaksi',
                                              style: AppFont.title1,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              // controller.jumlahSimpanan.value
                                              //     .toString(),
                                              NumberFormat.currency(
                                                      symbol: 'Rp',
                                                      decimalDigits: 0,
                                                      locale: 'id_ID')
                                                  .format(controller
                                                      .totalTransaksi.value),
                                              style: AppFont.title42,
                                            ),
                                          ],
                                        ),
                                      )),
                                  Obx((() => controller.angsuranSaya.value!
                                              .data!.buktiPembayaran !=
                                          null
                                      ? Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1.0,
                                                  color: AppColor.gray5),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Bukti Pembayaran',
                                                  style: AppFont.title1,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                  width: 30,
                                                  child: IconButton(
                                                      onPressed: (() {
                                                        controller.downloadFile(
                                                            controller
                                                                .angsuranSaya
                                                                .value!
                                                                .data!
                                                                .buktiPembayaran!);
                                                      }),
                                                      icon: const Icon(
                                                        CupertinoIcons
                                                            .arrow_down_to_line,
                                                        size: 20,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ))
                                      : const SizedBox())),
                                  Obx((() => controller.angsuranSaya.value!
                                              .data!.kwitansi !=
                                          null
                                      ? Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1.0,
                                                  color: AppColor.gray5),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25, vertical: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Kwitansi Transaksi',
                                                  style: AppFont.title1,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: IconButton(
                                                      onPressed: (() {
                                                        controller.downloadFile(
                                                            controller
                                                                .angsuranSaya
                                                                .value!
                                                                .data!
                                                                .kwitansi!);
                                                      }),
                                                      icon: const Icon(
                                                        CupertinoIcons
                                                            .arrow_down_to_line,
                                                        size: 20,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ))
                                      : const SizedBox()))
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AppButton(
                            text: 'Kembali',
                            color: AppColor.sRed,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))));
  }
}
