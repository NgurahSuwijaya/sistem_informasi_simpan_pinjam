import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_pengajuan.controller.dart';

class DetailPengajuanScreen extends GetView<DetailPengajuanController> {
  const DetailPengajuanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengajuan Pinjaman'),
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
                        "Detail Pengajuan Pinjaman",
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
                              "11/02/2023",
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
                                  'Keterangan Jaminan',
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
                                      "Tipe Jaminan",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      "Kendaraan Roda Dua",
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
                                      "Nama Jaminan",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      "Vario 150 (2022)",
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
                                      "Nilai Aset Jaminan",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      "Rp15,000,000",
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
                                  'Informasi Pengajuan',
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
                                      "Jenis Bunga",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      "Bunga Menetap",
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
                                      "Jangka Waktu",
                                      style: AppFont.title3,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "12",
                                          style: AppFont.title2,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Bulan',
                                          style: AppFont.title2,
                                        )
                                      ],
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
                                      "Kategori Pinjaman ",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      "Profuktif",
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
                                      "Bunga",
                                      style: AppFont.title3,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "1",
                                          style: AppFont.title2,
                                        ),
                                        // SizedBox(
                                        //   width: 5,
                                        // ),
                                        Text(
                                          '% per Bulan',
                                          style: AppFont.title2,
                                        )
                                      ],
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
                                      "Jumlah Pinjaman",
                                      style: AppFont.title3,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Rp",
                                          style: AppFont.title4,
                                        ),
                                        const SizedBox(
                                          width: 1,
                                        ),
                                        Text(
                                          '50,000,000',
                                          style: AppFont.title4,
                                        )
                                      ],
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
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                  text: "Simpan",
                  onPressed: () {
                    Get.toNamed('');
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
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
