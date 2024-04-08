import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/core/usecase/pinjaman_usecase.dart';
import '../../../domain/entities/bunga_pinjaman.dart';
import '../../../domain/entities/kategori_pinjaman.dart';
import '../../../domain/entities/tipe_jaminan.dart';
import '../../../widget/app_ok_dialog.dart';

class DetailPengajuanController extends GetxController {
  final PinjamanUseCase _pinjamanUseCase;
  final tipeJaminan = Rx<TipeJaminan?>(null);
  final kategoriPinjaman = Rx<KategoriPinjaman?>(null);
  final bungaPinjaman = Rx<BungaPinjaman?>(null);
  final nilaiAsetJaminan = ''.obs;
  final jumlahPinjaman = ''.obs;
  final namaJaminan = ''.obs;
  final tipeAngsuran = ''.obs;
  final jenisBunga = ''.obs;
  final jaminanFile = Rx<File?>(File(''));
  final RxBool tOS = false.obs;

  DetailPengajuanController(this._pinjamanUseCase);

  @override
  void onInit() {
    super.onInit();
    // initializeDateFormatting('id_ID', null);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> postPengajuanSimpanan(
      String tAngsuran,
      KategoriPinjaman kategoriPinjaman,
      String jBunga,
      BungaPinjaman bungaPinjaman,
      TipeJaminan tipeJaminan,
      String namaJaminan,
      int nilaiJaminan,
      int jmlhPinjaman,
      File jFile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final tokenn = preferences.getString('token');
    final result = await _pinjamanUseCase.onPostPengajuanData(
        token: tokenn,
        kategoriPinjamanId: kategoriPinjaman.id.toString(),
        bungaPinjamanId: bungaPinjaman.id.toString(),
        tipeBungaPinjaman: jBunga,
        jumlah: jmlhPinjaman,
        tipeJaminanId: tipeJaminan.id.toString(),
        nilaiAsetJaminan: nilaiJaminan,
        namaAsetJaminan: namaJaminan,
        dokumenAsetJaminan: jFile,
        tipeAngsuran: tAngsuran);
    result.fold(
        (l) => {Get.snackbar('Error', l.message), print(l.message)},
        (r) => {
              Get.dialog(AppOkeDialog(
                  title: "Berhasil!",
                  onPressed: () => Get.offAllNamed('/home'),
                  content:
                      "Berhasil melakukan pengajuan pinjaman! Pengajuan anda akan segera di validasi oleh pengurus koperasi mohon ditunggu.")),
            });
  }

  void previewFile({required String filePath}) {
    if (filePath.endsWith('.pdf')) {
      Navigator.of(Get.context!).push(
        MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(filePath.split('/').last),
            ),
            body: Container(
              child: PDFView(
                filePath: filePath,
                fitEachPage: true,
                fitPolicy: FitPolicy.BOTH,
              ),
            ),
          ),
        ),
      );
    } else {
      Get.snackbar(
        'Error',
        'File format not supported',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
