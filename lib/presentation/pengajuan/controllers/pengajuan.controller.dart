import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/pinjaman_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/bunga_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/kategori_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_jaminan.dart';

class PengajuanController extends GetxController {
  final PinjamanUseCase _pinjamanUseCase;
  final selectedKategoriPinjaman = Rx<KategoriPinjaman?>(null);
  final selectedJenisBunga = ''.obs;
  final kategoriPinjamanHasSelected = false.obs;
  final jaminanFile = Rx<File?>(File(''));
  final hasSelectedFile = RxBool(false);
  final nilaiAsetJaminan = TextEditingController();
  final jumlahPinjaman = TextEditingController();
  final namaJaminan = TextEditingController();

  final selectedTipeJaminan = Rx<TipeJaminan?>(null);
  final selectedTipeAngsuran = "".obs;
  final RxList<KategoriPinjaman?> kategoriPinjamanList = [
    KategoriPinjaman(
        id: 0,
        institutionId: 0,
        name: "name",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ].obs;
  final RxList<TipeJaminan?> tipeJaminanList = [
    TipeJaminan(
        id: 0,
        namaTipeJaminan: "namaTipeJaminan",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ].obs;
  final RxList<BungaPinjaman?> bungaPinjamanList =
      [BungaPinjaman(0, "jangkaWaktu", 0, 0, 0)].obs;
  final selectedBungaPinjaman = Rx<BungaPinjaman?>(null);
  PengajuanController(this._pinjamanUseCase);
  @override
  void onInit() {
    super.onInit();
    getKategoriPinjamanData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setTipeAngsuran(String? value) {
    selectedTipeAngsuran.value = value.toString();
    print(selectedTipeAngsuran.value);
  }

  void setJenisBunga(String? value) {
    selectedJenisBunga.value = value.toString();
    print(selectedJenisBunga.value);
  }

  void setHasKategoriPinjaman() {
    if (kategoriPinjamanHasSelected.value) {
      kategoriPinjamanHasSelected.value = false;
    } else {
      kategoriPinjamanHasSelected.value = true;
    }
  }

  Future<void> selectFile() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar('Permission denied',
            'Please grant storage permission to select a file');
        return;
      }
    }

    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null) {
      jaminanFile.value = File(pickedFile.files.single.path!);
      print(jaminanFile.value);

      // Check file size
      final fileSize = await jaminanFile.value!.length();
      if (fileSize > 5 * 1024 * 1024) {
        Get.snackbar(
          'Error',
          'File size must not exceed 5MB',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        deleteFile();
        return;
      }
      hasSelectedFile.value = true;
    }
  }

  void deleteFile() {
    jaminanFile.value = File('');
    hasSelectedFile.value = false;
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

  Future<void> getKategoriPinjamanData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await _pinjamanUseCase.onGetKategoriPinjaman(token: token);
    result.fold((l) => Get.snackbar('Error', l.message),
        (r) => kategoriPinjamanList.value = r.data);
  }

  Future<void> getBungaPinjamanData() async {
    print('imhere');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    // if (selectedJenisBunga.value != "" &&
    //     selectedTipeAngsuran.value != "" &&
    //     selectedKategoriPinjaman.value != null) {
    final result = await _pinjamanUseCase.onGetPengajuanData(
        token: token,
        kategoriPinjamanId: selectedKategoriPinjaman.value!.id,
        tipeAngsuran: selectedTipeAngsuran.value,
        tipeBunga: selectedJenisBunga.value);
    result.fold((l) {
      Get.snackbar('Error', l.message);
      print(l.message);
    }, (r) {
      print(r.message);
      tipeJaminanList.value = r.tipeJaminan;
      bungaPinjamanList.value = r.bungaPinjaman;
      kategoriPinjamanHasSelected.value = true;
    });
    // }
  }

  void getPengajuanRequest() {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    final tipeAngsuranDetail = selectedTipeAngsuran.value;
    final kategoriPinjamanDetail = selectedKategoriPinjaman.value;
    final jenisBungaDetail = selectedJenisBunga.value;
    BungaPinjaman? bungaPinjamanDetail;
    if (jenisBungaDetail == 'menurun') {
      bungaPinjamanDetail = bungaPinjamanList.value[0];
      print(bungaPinjamanDetail);
    } else {
      bungaPinjamanDetail = selectedBungaPinjaman.value;
    }

    final tipeJaminanDetail = selectedTipeJaminan.value;
    final namaJaminanDetail = namaJaminan.text;
    final nilaiAsetJaminanDetail =
        currencyFormat.parse(nilaiAsetJaminan.text).toInt();
    final jumlahPinjamanDetail =
        currencyFormat.parse(jumlahPinjaman.text).toInt();
    final fileJaminan = jaminanFile.value;

    if (tipeAngsuranDetail != "" &&
        kategoriPinjamanDetail != null &&
        jenisBungaDetail != "" &&
        tipeJaminanDetail != null &&
        namaJaminanDetail != "" &&
        nilaiAsetJaminanDetail != null &&
        jumlahPinjamanDetail != null &&
        fileJaminan != null) {
      Get.toNamed('/detail-pengajuan', arguments: [
        tipeAngsuranDetail,
        kategoriPinjamanDetail,
        jenisBungaDetail,
        bungaPinjamanDetail,
        tipeJaminanDetail,
        namaJaminanDetail,
        nilaiAsetJaminanDetail,
        jumlahPinjamanDetail,
        fileJaminan.path
      ]);
    } else {
      Get.snackbar('Notifikasi', 'Lengkapi Data Sebelum Melanjutkan');
    }
  }
}
