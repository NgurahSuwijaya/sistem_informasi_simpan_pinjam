import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/simpanan_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_alert_dialog.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_ok_dialog.dart';

class KontrolPenarikanController extends GetxController {
  final SimpananUseCase simpananUseCase;
  final idSimpanan = 0.obs;
  final content = "".obs;

  final count = 0.obs;

  KontrolPenarikanController(this.simpananUseCase);
  @override
  void onInit() {
    super.onInit();
    getArgumentPrevPage();
    // onShowDialog();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void getArgumentPrevPage() {
    final arg = Get.arguments;
    content.value = arg[0];
    idSimpanan.value = int.parse(arg[1]);
  }

  void onShowDialog() {
    Get.dialog(CupertinoAlertDialog(
      title: const Text("Kontrol penarikan"),
      content: const Text("Apakah anda mengijinkan penarikan simpanan?"),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Batal'),
          onPressed: () {
            Get.back();
            Get.dialog(AppAlertDialog(
                onPressed: () => onRejectPenarikan(idSimpanan.value),
                title: "Kontrol penarikan",
                content: "Apakah anda akan membatalkan transaksi ini ?"));
          },
        ),
        CupertinoDialogAction(
          onPressed: (() => {
                Get.back(),
                Get.dialog(AppAlertDialog(
                    onPressed: () => onAcceptPenarikan(idSimpanan.value),
                    title: "Kontrol penarikan",
                    content:
                        "Apakah anda benar-benar menyetujui transaksi penarikan ini?"))
              }),
          child: const Text('Terima'),
        ),
      ],
    ));
  }

  Future<void> onAcceptPenarikan(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final result =
        await simpananUseCase.onIjinkanPenarikanData(token: token, id: id);
    result.fold(
        (l) => Get.dialog(AppOkeDialog(
              title: "Transaksi Gagal",
              content: l.message,
              onPressed: () => {Get.back(), Get.offAllNamed('/home')},
            )),
        (r) => Get.dialog(AppOkeDialog(
              title: "Transaksi Berhasil",
              content: "Transaksi penarikan berhasil disetujui",
              onPressed: () => {Get.back(), Get.offAllNamed('/home')},
            )));
  }

  Future<void> onRejectPenarikan(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final result =
        await simpananUseCase.onTolakPenarikanData(token: token, id: id);
    result.fold(
        (l) => Get.dialog(AppOkeDialog(
              title: "Transaksi Gagal",
              content: l.message,
              onPressed: () => {Get.back(), Get.offAllNamed('/home')},
            )),
        (r) => Get.dialog(AppOkeDialog(
              title: "Transaksi Berhasil",
              content: "Transaksi penarikan berhasil ditolak",
              onPressed: () => {Get.back(), Get.offAllNamed('/home')},
            )));
  }
}
