import 'dart:async';
import 'package:SIMPIN/widget/app_ok_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/core/usecase/login_usecase.dart';
import '../../../domain/core/usecase/simpanan_usecase.dart';
import '../../../domain/entities/institution.dart';
import '../../../domain/entities/member.dart';
import '../../../domain/entities/simpanan.dart';
import '../../../domain/entities/tipe_simpanan.dart';
import '../../../domain/entities/tipe_transaksi.dart';
import '../../../domain/entities/user.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  final SimpananUseCase getSimpanandata;
  final AuthUsecase authUsecase;
  RxBool isPasswordVisible = false.obs;
  RxInt currentPageIndex = 0.obs;
  final saldoBiasa = 0.obs;
  final saldoPokok = 0.obs;
  final saldoWajib = 0.obs;
  final saldoGiro = 0.obs;
  final giroInstitusi = false.obs;
  final saldoAwalGiro = 0.obs;
  final maksPenarikan = 0.obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  RxBool isSukarelaVisible = false.obs;
  RxBool isWajibVisible = false.obs;
  RxBool isGiroVisible = false.obs;
  RxBool isPokokVisible = false.obs;
  Timer? backgroundTimer;
  DateTime? lastLoginTime;

  final simpananData = Rx<Simpanan>(Simpanan(
    id: 0,
    institutionId: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    adminId: 0,
    buktiPembayaran: '',
    jumlah: 0,
    member: Member(
      id: 0,
      institutionId: 0,
      userId: 0,
      jenisKelamin: '',
      tanggalLahir: DateTime.now(),
      tempatLahir: '',
      nomorIndukAnggota: '',
      nomorKtp: '',
      memberStatus: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      user: User(
          id: 0,
          roleId: 0,
          name: '',
          email: '',
          phoneNumber: '',
          address: '',
          city: '',
          province: '',
          photoPath: '',
          institutionId: 0,
          institutions: Institution(
              id: 0,
              name: '',
              address: "",
              city: "",
              province: "",
              phoneNumber: "",
              email: "",
              photoPath: "",
              persentaseBungaSimpanan: 0,
              persentasePajakBungaSimpanan: 0,
              awalTahunBuku: 0,
              status: '',
              // note: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now())),
      kontrolPenarikan: '',
      rekeningGiro: false,
    ),
    memberId: 0,
    metodeSimpanan: '',
    saldo: 0,
    statusTransaksi: '',
    tanggalTransaksi: DateTime.now(),
    tipeSimpananId: 0,
    tipeSimpanans: TipeSimpanans(
        createdAt: DateTime.now(),
        id: 0,
        updatedAt: DateTime.now(),
        name: '',
        institutionId: 0),
    tipeTransaksiId: 0,
    tipeTransaksis: TipeTransaksis(
        id: 0,
        institutionId: 0,
        name: '',
        pengali: 0,
        perhitunganBunga: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    verifiedAt: DateTime.now(),
    rekening: '',
    kwitansi: '',
  ));

  HomeController(this.getSimpanandata, this.authUsecase);

  final _isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSimpanan();
    startBackgroundTimer();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onReady() {
    super.onReady();
    // Get.toNamed('/home');
  }

  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    stopBackgroundTimer();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Aplikasi dipindahkan ke latar belakang
      lastLoginTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      // Aplikasi kembali dari latar belakang
      checkBackgroundTimeout();
    }
  }

  void startBackgroundTimer() {
    backgroundTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      checkBackgroundTimeout();
    });
  }

  void stopBackgroundTimer() {
    backgroundTimer?.cancel();
  }

  void checkBackgroundTimeout() {
    DateTime? currentTime = DateTime.now();
    if (lastLoginTime != null &&
        currentTime.difference(lastLoginTime!) >= Duration(minutes: 5)) {
      logOut();
    }
  }

  void onShowSukarela() {
    isSukarelaVisible.value = !isSukarelaVisible.value;
  }

  void onShowWajib() {
    isWajibVisible.value = !isWajibVisible.value;
  }

  void onShowPokok() {
    isPokokVisible.value = !isPokokVisible.value;
  }

  void onShowGiro() {
    isGiroVisible.value = !isGiroVisible.value;
  }

  Future<void> getSimpanan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoading.value = false;
    final token = prefs.getString('token');
    print(token);
    if (token != null) {
      final result = await getSimpanandata.onGetSimpananData(token: token);

      result.fold((failure) {
        _isLoading.value = false;
        Get.snackbar('simpanan get error', failure.message);

        print(failure.message);
      }, (success) {
        _isLoading.value = false;
        simpananData.value = success.data;
        saldoBiasa.value = success.saldoBiasa!;
        saldoGiro.value = success.saldoGiro!;
        saldoPokok.value = success.saldoPokok!;
        saldoWajib.value = success.saldoWajib!;
        giroInstitusi.value = success.giroInstitusi!;
        saldoAwalGiro.value = success.saldoAwalGiro!;
        maksPenarikan.value = success.maksPenarikan!;
        print(success.data.member!.user.name);
      });
    } else {
      Get.snackbar("Error", "Anda keluar dari akun");
      Get.offAllNamed('/login');
    }
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoading.value = false;
    final token = prefs.getString('token');
    await Future.delayed(const Duration(milliseconds: 1000));
    final result = await authUsecase.onLogOutUser(token: token);

    result.fold((l) {
      _isLoading.value = false;
      Get.snackbar('logout error', l.message);
      print(l.message);
      Get.offAllNamed('/login');
      // Get.back();
    }, (r) {
      _isLoading.value = false;
      clearSharedPreferences();
      lastLoginTime = null; // Reset waktu login terakhir
      Get.offAllNamed('/login');
      // Get.dialog(AppOkeDialog(
      //   title: "Pemberitahuan",
      //   content: "Akun telah di logout",
      //   onPressed: (() => Get.back()),
      // ));
      Get.snackbar("Pemberitahuan", "Akun anda telah di logout");
    });
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void onRefresh() async {
    getSimpanan();
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }
}
