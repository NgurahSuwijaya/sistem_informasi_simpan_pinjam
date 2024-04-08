import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_transaksi_simpanan.controller.dart';

class DetailTransaksiSimpananScreen
    extends GetView<DetailTransaksiSimpananController> {
  const DetailTransaksiSimpananScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Transaksi'),
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
                                              DateFormat('dd MMMM yyyy').format(
                                                  controller.simpananSaya.value
                                                      .data.tanggalTransaksi
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
                                                          .simpananSaya
                                                          .value
                                                          .data
                                                          .statusTransaksi ==
                                                      'pending'
                                                  ? AppColor.sYellow
                                                  : controller
                                                              .simpananSaya
                                                              .value
                                                              .data
                                                              .statusTransaksi ==
                                                          'ditolak'
                                                      ? AppColor.sRed
                                                      : controller
                                                                  .simpananSaya
                                                                  .value
                                                                  .data
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
                                                  controller.simpananSaya.value
                                                      .data.statusTransaksi,
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
                                              'Keterangan Simpanan',
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
                                                // if (controller.isSetoran.value)
                                                Text(
                                                  controller
                                                      .simpananSaya
                                                      .value
                                                      .data
                                                      .tipeTransaksis!
                                                      .name,
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
                                                  "Rekening Simpanan",
                                                  style: AppFont.title3,
                                                ),
                                                Text(
                                                  controller.simpananSaya.value
                                                      .data.rekening,
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
                                                  "Tipe Simpanan",
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
                                                  "Simpanan ${controller.simpananSaya.value.data.tipeSimpanans!.name}",
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
                                                  controller.simpananSaya.value
                                                      .data.metodeSimpanan,
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
                                                      .format(controller
                                                          .simpananSaya
                                                          .value
                                                          .data
                                                          .jumlah),
                                                  style: AppFont.title4,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  controller.simpananSaya.value.data
                                              .buktiPembayaran !=
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
                                                  'Bukti Bayar',
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
                                                        controller
                                                            .downloadFileBuktiBayar(
                                                                controller
                                                                    .simpananSaya
                                                                    .value
                                                                    .data
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
                                      : const SizedBox(),
                                  controller.simpananSaya.value.data.kwitansi !=
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
                                                        controller
                                                            .downloadFileBuktiKwitansi(
                                                                controller
                                                                    .simpananSaya
                                                                    .value
                                                                    .data
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
                                      : const SizedBox()
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
