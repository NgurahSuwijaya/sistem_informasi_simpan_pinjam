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
  final PinjamanController pinjamanController;
  const PinjamanContent({super.key, required this.pinjamanController});

  @override
  State<PinjamanContent> createState() => _PinjamanContentState();
}

class _PinjamanContentState extends State<PinjamanContent> {
  @override
  Widget build(BuildContext context) {
    DateTime tglPinjaman;
    tglPinjaman = widget.pinjamanController.pinjamanData.value.tanggalPinjaman;
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(tglPinjaman.toLocal());
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
                child: Obx((() => widget.pinjamanController.pinjamanData.value
                            .bungaMenetapId !=
                        null
                    ? Text(
                        'Pinjaman Bunga Menetap',
                        style: AppFont.title1,
                      )
                    : Text(
                        'Pinjaman Bunga Menurun',
                        style: AppFont.title1,
                      ))),
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
                      style: AppFont.title2,
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
                      "Suku Bunga Pinjaman Perbulan",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Obx((() => widget.pinjamanController.pinjamanData.value
                                .bungaMenetapId !=
                            null
                        ? Row(
                            children: [
                              Text(
                                widget.pinjamanController.pinjamanData.value
                                    .bungaMenetap!.persentaseBunga
                                    .toString(),
                                style: AppFont.title2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '%',
                                style: AppFont.title2,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                widget.pinjamanController.pinjamanData.value
                                    .bungaMenurun!.persentaseBunga
                                    .toString(),
                                style: AppFont.title2,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '%',
                                style: AppFont.title2,
                              ),
                            ],
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
                  child: Obx((() => widget.pinjamanController.pinjamanData.value
                              .bungaMenetapId !=
                          null
                      ? Column(
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
                                  widget.pinjamanController.pinjamanData.value
                                      .bungaMenetap!.jangkaWaktu
                                      .toString(),
                                  style: AppFont.title2,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Bulan",
                                  style: AppFont.title2,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
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
                            Row(
                              children: [
                                Text(
                                  widget.pinjamanController.pinjamanData.value
                                      .bungaMenurun!.batasDurasiPinjamanBerjalan
                                      .toString(),
                                  style: AppFont.title2,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Bulan",
                                  style: AppFont.title2,
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
                  child: Obx((() => AppInput(
                        topText: "Jumlah Pinjaman",
                        hint: "Jumlah Pinjaman",
                        value: widget
                            .pinjamanController.pinjamanData.value.jumlah
                            .toString(),
                        textInputType: TextInputType.none,
                        obscureText: false,
                        canEdit: false,
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
                          widget.pinjamanController.pinjamanData.value
                              .namaAsetJaminan,
                          style: AppFont.title2,
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
