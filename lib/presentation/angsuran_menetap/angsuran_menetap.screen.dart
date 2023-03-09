import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import '../../widget/app_card_button.dart';
import '../../widget/app_dropdown.dart';
import '../../widget/app_input.dart';
import 'controllers/angsuran_menetap.controller.dart';

class AngsuranMenetapScreen extends GetView<AngsuranMenetapController> {
  AngsuranMenetapScreen({Key? key}) : super(key: key);
  final List<String> bank = [
    'BPD',
    'BCA',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AngsuranMenetapScreen'),
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
                Container(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        "Angsuran Bunga Menetap",
                        style: AppFont.title1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                              "Informasi Pinjaman",
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
                                  "Jenis Pinjaman",
                                  style: AppFont.title3,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Pinjaman Bunga Menetap",
                                  style: AppFont.title42,
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
                                  "Tanggal Jatuh Tempo",
                                  style: AppFont.title3,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "1 November 2024",
                                  style: AppFont.title4,
                                ),
                              ],
                            ),
                          )),
                      // Container(
                      //     width: double.infinity,
                      //     decoration: const BoxDecoration(
                      //       border: Border(
                      //         bottom:
                      //             BorderSide(width: 1.0, color: AppColor.gray5),
                      //       ),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 25, vertical: 20),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             "Angsuran Ke-",
                      //             style: AppFont.title3,
                      //           ),
                      //           const SizedBox(
                      //             height: 5,
                      //           ),
                      //           Text(
                      //             "Ke 4",
                      //             style: AppFont.title4,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pembayaran Angsuran Pokok + Bunga",
                                  style: AppFont.title3,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rp",
                                      style: AppFont.title4,
                                    ),
                                    Text(
                                      "1.000.000",
                                      style: AppFont.title4,
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
                                  "Biaya Admin + Denda",
                                  style: AppFont.title3,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rp",
                                      style: AppFont.title41,
                                    ),
                                    Text(
                                      "1.000.000",
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Pembayaran",
                                  style: AppFont.title3,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rp",
                                      style: AppFont.title42,
                                    ),
                                    Text(
                                      "1.000.000",
                                      style: AppFont.title42,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                              "Form Pembayaran Angsuran",
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
                                AppInput(
                                    value: '11 November 2023',
                                    hint: 'Tanggal Pembayaran',
                                    topText: 'Tanggal Pembayaran',
                                    obscureText: false,
                                    canEdit: false),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppInput(
                                    hint: 'Rp 1.000.000',
                                    topText: 'Jumlah yang dibayarkan',
                                    obscureText: false,
                                    canEdit: true),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Keterangan Tambahan',
                                      style: AppFont.title1,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      readOnly: false,
                                      // controller: widget.controller,

                                      maxLines: 5,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                          hintMaxLines: 5,
                                          hintText:
                                              "Sisa Pembayaran Ditambahkan Ke Simpanan",
                                          hintStyle: const TextStyle(
                                              color: AppColor.gray1),
                                          // suffixIcon: widget.sufixIcons,
                                          // prefixIcon: widget.prefixIcons,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: AppColor.gray1))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Tipe Jaminan",
                                      style: AppFont.title1,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppDropDown(
                                      items: bank,
                                      name: 'Bank Tujuan',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppInput(
                                    hint: '',
                                    value: '7729029094',
                                    topText: 'Nomor Rekening Koperasi',
                                    obscureText: false,
                                    canEdit: true),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bukti Bayar",
                                        style: AppFont.title1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Bukti pembayaran berupa",
                                                style: AppFont.subtitle3,
                                              ),
                                              Text(
                                                "bukti transfer ke rekening",
                                                style: AppFont.subtitle3,
                                              ),
                                              Text(
                                                "yang tercantum",
                                                style: AppFont.subtitle3,
                                              ),
                                            ],
                                          ),
                                          //
                                          SizedBox(
                                            height: 40,
                                            width: 100,
                                            child: ElevatedButton(
                                              onPressed: (() {}),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColor.green1,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5))),
                                              child: Text(
                                                "Pilih file",
                                                style: AppFont.button,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
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
                            padding: const EdgeInsets.only(
                                left: 25, top: 10, right: 25, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Informasi Pinjaman Aktif",
                                  style: AppFont.title1,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(CupertinoIcons.trash))
                              ],
                            ),
                          )),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    AppButton(
                      text: "Lanjutkan",
                      onPressed: () {
                        Get.toNamed('/detail-angsuran');
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
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
