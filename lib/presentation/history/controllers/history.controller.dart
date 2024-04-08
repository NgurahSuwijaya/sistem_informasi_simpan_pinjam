import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/usecase/member_usecase.dart';
import '../../../domain/entities/response_transaksi_saya.dart';

class HistoryController extends GetxController {
  final MemberUseCase memberUseCase;
  final RxInt halamanSaatIni = 1.obs;
  final RxInt to = 1.obs;
  final RxInt responseCurrentPage = 1.obs;
  final RxInt total = 1.obs;
  final RxInt length = 1.obs;
  final RxList<TransaksiSaya> semuaTransaksiSaya = <TransaksiSaya>[].obs;
  bool isHasNextPage = false;
  final scrollController = ScrollController();
  final isLoadingData = false.obs;

  HistoryController(this.memberUseCase);

  @override
  void onInit() {
    super.onInit();
    getTransaksiSaya();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLoadingData.value) {
          loadDataAfterScroll();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> getTransaksiSaya() async {
    isLoadingData.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await memberUseCase.onGetTransaksiSaya(
      token: token,
      page: halamanSaatIni.value,
    );
    result.fold(
      (l) => Get.snackbar("Error", l.message),
      (r) => {
        semuaTransaksiSaya.addAll([...r.data!.data!]),
        total.value = r.data!.total!,
        length.value = semuaTransaksiSaya.length,
        isLoadingData.value = false,
        if (r.data?.nextPageUrl != null) {isHasNextPage = true},
      },
    );
  }

  void goToDetailSimpanan(int id, String tipeTransaksi) {
    Get.toNamed('/detail-transaksi-simpanan', arguments: [id, tipeTransaksi]);
  }

  void goToDetailPinjaman(int id, String tipeTransaksi) {
    Get.toNamed('/detail-transaksi-pinjaman', arguments: [id, tipeTransaksi]);
  }

  void goToDetailAngsuran(int id, String tipeTransaksi) {
    Get.toNamed('/detail-transaksi-angsuran', arguments: [id, tipeTransaksi]);
  }

  void loadDataAfterScroll() {
    if (isHasNextPage) {
      halamanSaatIni.value++;
      getTransaksiSaya();
    }
  }
}
