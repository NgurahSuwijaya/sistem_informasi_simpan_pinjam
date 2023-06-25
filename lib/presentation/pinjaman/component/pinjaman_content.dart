import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/main.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pinjaman/controllers/pinjaman.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_input.dart';

class PinjamanContent extends StatefulWidget {
  final PinjamanController controller;
  const PinjamanContent({super.key, required this.controller});

  @override
  State<PinjamanContent> createState() => _PinjamanContentState();
}

class _PinjamanContentState extends State<PinjamanContent> {
  @override
  Widget build(BuildContext context) {
    DateTime tglPinjaman;
    tglPinjaman = widget.controller.pinjamanData.value!.tanggalPinjaman!;
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(tglPinjaman);
    return SizedBox(
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
                  bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'Pinjaman Bunga ${widget.controller.pinjamanData.value!.tipeBungaPinjaman![0].toUpperCase()}${widget.controller.pinjamanData.value!.tipeBungaPinjaman!.substring(1)}',
                  style: AppFont.title4,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Pinjaman",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      formattedDate,
                      style: AppFont.title3,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Suku Bunga Pinjaman",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx((() => Text(
                          '${widget.controller.pinjamanData.value!.bungaPinjaman!.persentaseBunga.toString()}%',
                          style: AppFont.title3,
                        ))),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Obx((() =>
                      widget.controller.pinjamanData.value!.tipeBungaPinjaman ==
                              'menurun'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Batas Durasi Pinjaman Berjalan",
                                  style: AppFont.title1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${widget.controller.pinjamanData.value!.bungaPinjaman!.batasDurasiPinjamanBerjalan.toString()} Bulan',
                                  style: AppFont.title3,
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jangka Waktu",
                                  style: AppFont.title1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${widget.controller.pinjamanData.value!.bungaPinjaman!.jangkaWaktu.toString()} Bulan',
                                      style: AppFont.title3,
                                    ),
                                  ],
                                ),
                              ],
                            ))))),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                ),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Obx((() => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah Pinjaman",
                            style: AppFont.title1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColor.gray5),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                    NumberFormat.currency(
                                            symbol: 'Rp',
                                            decimalDigits: 0,
                                            locale: 'id_ID')
                                        .format(widget.controller.pinjamanData
                                            .value!.jumlah)
                                        .toString(),
                                    style: AppFont.title2),
                              ),
                            ),
                          ),
                        ],
                      ))))),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Jaminan",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx((() => Text(
                          widget
                              .controller.pinjamanData.value!.namaAsetJaminan!,
                          style: AppFont.title3,
                        )))
                  ],
                ),
              )),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Jenis Jaminan",
                      style: AppFont.title1,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.cloud_download_fill,
                          color: AppColor.blackComponent,
                        ))
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
