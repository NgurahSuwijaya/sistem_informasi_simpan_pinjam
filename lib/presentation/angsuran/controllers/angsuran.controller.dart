import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/bank_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';

import '../../../domain/entities/response_bank.dart';
import '../../../widget/app_image_preview.dart';

class AngsuranController extends GetxController {
  final GetBankData bankDataUseCase;
  final isLoading = false.obs;

  final RxString rekening = "Pilih Rekening Koperasi".obs;
  final RxString rekeningAN = "Pilih Rekening Koperasi".obs;
  final RxString rekeningNom = "Pilih Rekening Koperasi".obs;
  final jumlahBayarController = TextEditingController();

  final isBankHasSelected = false.obs;

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

  final Rx<Bank?> chosedBank = Rx<Bank?>(null);

  final imageFile = Rx<File?>(File(''));
  final hasSelectedImage = RxBool(false);

  AngsuranController(this.bankDataUseCase);

  @override
  void onInit() {
    super.onInit();
    getBankData();
    initializeDateFormatting('id_ID', null);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setNomrek(String nomrek, String nama) {
    rekening.value = "$nomrek A/N $nama";
    rekeningNom.value = nomrek;
    rekeningAN.value = nama;
    isBankHasSelected.value = true;
  }

  Future<void> getBankData() async {
    isLoading.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await bankDataUseCase.onGetBankData(token: token);

    result.fold((l) {
      Get.snackbar('Error', l.message);
    }, (r) {
      bankList.value = r.data;
      isLoading.value = false;
    });
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

  void deleteImage() {
    imageFile.value = File('');
    hasSelectedImage.value = false;
  }

  void sendAngsuranDetail(ResponseTagihanAngsuran responseTagihanAngsuran) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    final jumlahPembayaranDetail =
        currencyFormat.parse(jumlahBayarController.text).toInt();
    final bankSimpananDetail = chosedBank.value;
    final buktiBayarSimpananDetail = imageFile.value;

    if (jumlahPembayaranDetail != null && isBankHasSelected.value) {
      if (jumlahPembayaranDetail <
          responseTagihanAngsuran.totalTagihan!.toInt()) {
        Get.snackbar("Error",
            'Jumlah pembayaran anda lebih kecil dari jumlah tagihan anda');
      } else {
        Get.toNamed('/detail-angsuran', arguments: [
          responseTagihanAngsuran,
          jumlahPembayaranDetail,
          bankSimpananDetail,
          buktiBayarSimpananDetail?.path
        ]);
      }
    } else {
      Get.snackbar("Notifikasi", 'Lengkapi Data Sebelum Melanjutkan');
    }
  }
}
