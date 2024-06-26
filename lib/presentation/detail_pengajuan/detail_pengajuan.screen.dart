import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/bunga_pinjaman.dart';
import '../../domain/entities/kategori_pinjaman.dart';
import '../../domain/entities/tipe_jaminan.dart';
import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_button.dart';
import 'controllers/detail_pengajuan.controller.dart';

class DetailPengajuanScreen extends GetView<DetailPengajuanController> {
  const DetailPengajuanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now());
    final arg = Get.arguments;
    final String tipeAngsuran = arg[0];
    final KategoriPinjaman kategoriPinjaman = arg[1];
    final String jenisBunga = arg[2];
    final BungaPinjaman? bungaPinjaman = arg[3];
    final TipeJaminan tipeJaminan = arg[4];
    final String namaJaminan = arg[5];
    final int nilaiAsetJaminan = arg[6];
    final int jumlahPinjaman = arg[7];
    print(nilaiAsetJaminan);
    final File jaminanFile = File(arg[8]);
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
                              formattedDate,
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
                                      tipeJaminan.namaTipeJaminan,
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
                                      namaJaminan,
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
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(nilaiAsetJaminan),
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
                                      "Tipe Angsuran",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      tipeAngsuran,
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
                                      "Jenis Bunga",
                                      style: AppFont.title3,
                                    ),
                                    Text(
                                      jenisBunga,
                                      style: AppFont.title2,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                (jenisBunga != 'menurun')
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Jangka Waktu",
                                            style: AppFont.title3,
                                          ),
                                          Text(
                                            bungaPinjaman!.jangkaWaktu
                                                .toString(),
                                            style: AppFont.title2,
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
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
                                      kategoriPinjaman.name,
                                      style: AppFont.title2,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                (jenisBunga != 'menurun')
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Bunga",
                                            style: AppFont.title3,
                                          ),
                                          Text(
                                            '${bungaPinjaman!.persentaseBunga}%',
                                            style: AppFont.title2,
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
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
                                    Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(jumlahPinjaman),
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
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "File Jaminan",
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
                                        controller.previewFile(
                                            filePath: jaminanFile.path);
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
                  text: "Simpan",
                  onPressed: () {
                    Get.dialog(CupertinoAlertDialog(
                      title: const Text("Persyaratan Peminjam"),
                      content: Column(
                        children: const [
                          SizedBox(height: 16),
                          Text(
                            """Nasabah/Anggota Koperasi akan mendapatkan dana sesuai dengan yang diajukan dan akan dibebankan bunga sesuai dengan ketentuan dan pengajuan dari nasabah ketika pengajuan disetujui. Nasabah akan dibebankan denda dan administrasi sesuai dengan ketentuan dari koperasi. Setelah pengajuan disetuji peminjam wajib meyerahkan dokumen jaminan yang tercantum ke koperasi pada waktu penyerahan dana pinjaman""",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Dengan melanjutkan, Anda menyetujui persyaratan di atas.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: const Text('Kembali'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          onPressed: (() => controller.postPengajuanSimpanan(
                              tipeAngsuran,
                              kategoriPinjaman,
                              jenisBunga,
                              bungaPinjaman!,
                              tipeJaminan,
                              namaJaminan,
                              nilaiAsetJaminan,
                              jumlahPinjaman,
                              jaminanFile)),
                          child: const Text('Lanjutkan'),
                        )
                      ],
                    ));
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
