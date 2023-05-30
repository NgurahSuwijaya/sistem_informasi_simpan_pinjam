import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';

import '../../../domain/core/usecase/angsuran_usecase.dart';
import '../../../widget/app_image_preview.dart';

class DetailAngsuranController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  final AngsuranUseCase _angsuranUseCase;

  DetailAngsuranController(this._angsuranUseCase);

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting('id_ID', null);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, reset the animation
        _animationController.reset();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  void playAnimation() {
    _animationController.forward();
  }

  void previewImage(File? bukti) {
    if (bukti != null) {
      Navigator.of(Get.context!).push(
        MaterialPageRoute(builder: (_) => ImagePreviewWidget(imageFile: bukti)),
      );
    }
  }

  Future<void> postBayarAngsuran(
      {required ResponseTagihanAngsuran responseTagihanAngsuran,
      required int jumlah,
      required String buktiBayar}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    final result = await _angsuranUseCase.onPostBayarAngsuran(
        token: token,
        responseTagihanAngsuran: responseTagihanAngsuran,
        jumlah: jumlah,
        buktiBayar: File(buktiBayar));

    result.fold((l) => Get.snackbar("Error", l.message),
        (r) => {Get.snackbar("Succes", r.message), Get.offAllNamed('/home')});
  }
}
