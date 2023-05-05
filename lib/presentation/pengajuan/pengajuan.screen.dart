import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';
import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_pengajuan_dropdown.dart';
import '../../widget/app_input.dart';
import 'controllers/pengajuan.controller.dart';

class PengajuanScreen extends GetView<PengajuanController> {
  PengajuanScreen({Key? key}) : super(key: key);

  final List<String> jenisBunga = [
    'Bunga Menetap',
    'Bunga Menurun',
  ];

  final List<String> jangkaWaktu = [
    '3',
    '6',
    '12',
    '18',
    '24',
    '30',
    '36',
    '42',
    '48',
    '52',
    ''
  ];

  final List<String> kategoriPinjaman = [
    'Produktif',
    'Konsumtif',
  ];

  final List<String> tipeJaminan = [
    'Kendaraan Roda Empat',
    'Kendaraan Roda Dua',
    'Sertifikat Tanah',
    'Sertifikat Bangunan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Pinjaman'),
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
                        "Pengajuan Pinjaman",
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
                              "Form Pengajuan Pinjaman",
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
                                  "Kategori Pinjaman",
                                  style: AppFont.title1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //                             DropdownButtonHideUnderline(
                                //   child: DropdownButton2(
                                //     hint: Row(
                                //       children: [
                                //         const SizedBox(
                                //           width: 15,
                                //         ),
                                //         Text(
                                //           'Kategori Pinjaman',
                                //           style: TextStyle(
                                //             fontSize: 14,
                                //             color: Theme.of(context).hintColor,
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //     items: kategoriPinjaman
                                //         .map((item) => DropdownMenuItem<String>(
                                //               value: item,
                                //               child: Row(
                                //                 children: [
                                //                   const SizedBox(
                                //                     width: 15,
                                //                   ),
                                //                   Text(item, style: AppFont.subtitle1),
                                //                 ],
                                //               ),
                                //             ))
                                //         .toList(),
                                //     value: selectedValue,
                                //     onChanged: (value) {
                                //       setState(() {
                                //         selectedValue = value as String;
                                //       });
                                //       widget.controller.updateSelectedItem(value as String);
                                //     },
                                //     buttonHeight: 60,
                                //     buttonWidth: double.infinity,
                                //     buttonDecoration: BoxDecoration(
                                //       color: AppColor.white,
                                //       borderRadius: BorderRadius.circular(5),
                                //       border: Border.all(width: 0.7, color: AppColor.gray1),
                                //     ),
                                //     buttonElevation: 0,
                                //     itemHeight: 40,
                                //     itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                //   ),
                                // ),
                                AppPengajuanDropDown(
                                  items: kategoriPinjaman,
                                  name: 'Kategori Pinjaman',
                                  controller: controller,
                                  selectedValue: controller.selectedItem.value,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Jenis Bunga",
                                  style: AppFont.title1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppPengajuanDropDown(
                                    items: jenisBunga,
                                    name: 'Jenis Bunga',
                                    controller: controller,
                                    selectedValue:
                                        controller.selectedItem.value),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Jangka Waktu (Bulan)",
                                  style: AppFont.title1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppPengajuanDropDown(
                                    items: jangkaWaktu,
                                    name: 'Jangka Waktu',
                                    controller: controller,
                                    selectedValue:
                                        controller.selectedItem.value),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppInput(
                                  value: '3',
                                  hint: 'Bunga (%) Per Bulan',
                                  topText: 'Bunga (%) Perbulan',
                                  obscureText: false,
                                  canEdit: false,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Tipe Jaminan",
                                  style: AppFont.title1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppPengajuanDropDown(
                                    items: tipeJaminan,
                                    name: 'Tipe Jaminan',
                                    controller: controller,
                                    selectedValue:
                                        controller.selectedItem.value),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppInput(
                                  hint: 'Contoh Honda Vario 160 2019',
                                  topText: 'Nama Aset Jaminan',
                                  obscureText: false,
                                  canEdit: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppInput(
                                  hint: '1000000',
                                  topText: 'Nilai Aset Jaminan (Rp)',
                                  obscureText: false,
                                  canEdit: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppInput(
                                  hint: '1000000',
                                  topText: 'Nominal Pinjaman (Rp)',
                                  obscureText: false,
                                  canEdit: true,
                                ),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      AppButton(
                        text: 'Lanjutkan',
                        onPressed: () {
                          Get.toNamed('/detail-pengajuan');
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppButton(
                        text: 'Kembali',
                        onPressed: () {
                          Get.back();
                        },
                        color: AppColor.sRed,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
