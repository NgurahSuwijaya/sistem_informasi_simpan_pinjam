import 'dart:io';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/bank_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/simpanan_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_bank.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_simpanan.dart';

import '../../../widget/app_image_preview.dart';

class SimpananController extends GetxController {
  final GetBankData _getBankData;
  final SimpananUseCase _simpananUseCase;
  final isSetoran = false.obs;
  final saldoSimpanan = 1.obs;

  final _isLoading = false.obs;

  final jumlahSimpananController = TextEditingController();

  final Rx<Bank?> chosedBank = Rx<Bank?>(null);
  String? choosedRekening = '';
  final Rx<TipeSimpanans?> chosedTipeSimpanan = Rx<TipeSimpanans?>(null);
  final RxString rekening = "Pilih Rekening Koperasi".obs;

  final imageFile = Rx<File?>(File(''));
  final hasSelectedImage = RxBool(false);

  final RxList<Bank> bankList = [
    Bank(
        id: 0,
        institutionId: 0,
        namaBank: "namaBank",
        nomorRekening: "nomorRekening",
        atasNama: "atasNama",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ].obs;

  final RxList<TipeSimpanans> tipeSimpananList = [
    TipeSimpanans(
        id: 0,
        institutionId: 0,
        name: "name",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ].obs;

  SimpananController(this._getBankData, this._simpananUseCase);

  @override
  void onInit() {
    super.onInit();
    getBankData();
    getArgumentNextPage();
    // getTipeSimpananData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPenarikan(String? value) {
    if (value == 'setoran') {
      isSetoran.value = true;
    } else {
      isSetoran.value = false;
    }
  }

  void getArgumentNextPage() {
    final arg = Get.arguments;
    saldoSimpanan.value = arg;
    print(saldoSimpanan.value);
  }

  Future<void> getBankData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await _getBankData.onGetBankData(token: token);

    result.fold((l) {
      Get.snackbar('Error', l.message);
    }, (r) {
      bankList.value = r.data;
    });
  }

  Future<void> getTipeSimpananData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final tipeSimpanan =
        await _simpananUseCase.onGetTipeSimpananData(token: token);
    tipeSimpanan.fold((l) => Get.snackbar('Error', l.message),
        (r) => tipeSimpananList.value = r.data);
  }

  void setNomrek(String nomrek, String nama) {
    rekening.value = "$nomrek A/N $nama";
  }

  Future<void> selectImage() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar('Permission denied',
            'Please grant storage permission to select an image');
        return;
      }
    }

    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);

      final fileType = lookupMimeType(pickedFile.path);
      if (fileType != null &&
          !(fileType.contains('jpg') ||
              fileType.contains('png') ||
              fileType.contains('jpeg'))) {
        Get.snackbar(
          'Error',
          'Please select a valid image file (JPG, JPEG, PNG)',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Check file size
      final fileSize = await pickedFile.length();
      if (fileSize > 5 * 1024 * 1024) {
        Get.snackbar(
          'Error',
          'File size must not exceed 5MB',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        deleteImage();
        return;
      }
      hasSelectedImage.value = true;
    }
  }

  void previewImage() {
    if (imageFile.value != null) {
      Navigator.of(Get.context!).push(
        MaterialPageRoute(
            builder: (_) => ImagePreviewWidget(imageFile: imageFile.value!)),
      );
    }
  }

  void setJenisRekening(String value) {
    choosedRekening = value;
  }

  void deleteImage() {
    imageFile.value = File('');
    hasSelectedImage.value = false;
  }

  void getSetoranRequest() {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    final jumlahSimpananDetail =
        currencyFormat.parse(jumlahSimpananController.text).toInt();
    final bankSimpananDetail = chosedBank.value;
    final jenisRekeningSimpananDetail = choosedRekening;
    final buktiBayarSimpananDetail = imageFile.value;
    print(jumlahSimpananDetail);
    if (imageFile.value != null &&
        jenisRekeningSimpananDetail != null &&
        bankSimpananDetail != null) {
      Get.toNamed('/detail-simpanan', arguments: [
        isSetoran.value,
        jenisRekeningSimpananDetail,
        jumlahSimpananDetail,
        bankSimpananDetail,
        buktiBayarSimpananDetail?.path
      ]);
    } else {
      Get.snackbar('Notifikasi', 'Lengkapi Data Sebelum Melanjutkan');
    }
  }

  void getPenarikanRequest() {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    final jumlahSimpananDetail =
        currencyFormat.parse(jumlahSimpananController.text).toInt();
    final jenisRekeningSimpananDetail = choosedRekening;
    print(jumlahSimpananDetail);
    print(saldoSimpanan.value);
    if (jenisRekeningSimpananDetail != null) {
      if (jumlahSimpananDetail < saldoSimpanan.value) {
        Get.toNamed('/detail-simpanan', arguments: [
          isSetoran.value,
          jenisRekeningSimpananDetail,
          jumlahSimpananDetail,
        ]);
      } else {
        Get.snackbar('Notifikasi',
            'Nominal Penarikan Harus Lebih Kecil dari Saldo Simpanan');
      }
    } else {
      Get.snackbar('Notifikasi', 'Lengkapi Data Sebelum Melanjutkan');
    }
  }
}
