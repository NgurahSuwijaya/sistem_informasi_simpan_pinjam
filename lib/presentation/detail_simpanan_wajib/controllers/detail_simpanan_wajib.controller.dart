import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/usecase/simpanan_usecase.dart';
import '../../../domain/entities/response_bank.dart';
import '../../../widget/app_image_preview.dart';

class DetailSimpananWajibController extends GetxController {
  final SimpananUseCase _simpananUseCase;

  final count = 0.obs;

  DetailSimpananWajibController(this._simpananUseCase);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void previewImage(File? bukti) {
    if (bukti != null) {
      Navigator.of(Get.context!).push(
        MaterialPageRoute(builder: (_) => ImagePreviewWidget(imageFile: bukti)),
      );
    }
  }

  Future<void> postBayarTagihanSimpananWajib(
      int jumlah, Bank? bank, File? bukti) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final tokenn = preferences.getString('token');

    final result = await _simpananUseCase.onPostSimpananData(
        token: tokenn,
        tipeSimpananId: 2,
        jumlah: jumlah,
        tipeSimpanan: "sukarela",
        tanggalTransaksi: DateTime.now(),
        rekening: 'biasa',
        buktiBayar: bukti,
        tipeTransaksiId: 1);

    result.fold((l) => {Get.snackbar('Error', l.message), print(l.message)},
        (r) => {Get.snackbar('Success', r.message), Get.offAllNamed('/home')});
  }
}
