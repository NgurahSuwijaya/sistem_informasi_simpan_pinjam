import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/simpanan_usecase.dart';

import '../../../domain/entities/response_bank.dart';
import '../../../widget/app_image_preview.dart';

class DetailSimpananController extends GetxController {
  final SimpananUseCase _simpananUseCase;
  final _isLoading = false.obs;
  final isSetoran = false.obs;

  DetailSimpananController(this._simpananUseCase);

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

  Future<void> postSimpananOnline2(bool isSetoran, String rekening, int jumlah,
      Bank? bank, File? bukti) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final tokenn = preferences.getString('token');
    final int tipeTransaksi;
    print(tokenn);
    _isLoading.value = true;
    if (isSetoran) {
      tipeTransaksi = 1;
    } else {
      tipeTransaksi = 2;
    }

    final result = await _simpananUseCase.onPostSimpananData(
        token: tokenn,
        tipeSimpananId: 3,
        jumlah: jumlah,
        tipeSimpanan: "sukarela",
        tanggalTransaksi: DateTime.now(),
        rekening: rekening,
        buktiBayar: bukti,
        tipeTransaksiId: tipeTransaksi);

    result.fold((l) => {Get.snackbar('Error', l.message), print(l.message)},
        (r) => {Get.snackbar('Success', r.message), Get.offAllNamed('/home')});
  }

  void previewImage(File? bukti) {
    if (bukti != null) {
      Navigator.of(Get.context!).push(
        MaterialPageRoute(builder: (_) => ImagePreviewWidget(imageFile: bukti)),
      );
    }
  }
}
