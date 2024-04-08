import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/core/usecase/simpanan_usecase.dart';
import '../../../widget/app_alert_dialog.dart';
import '../../../widget/app_ok_dialog.dart';

class TransferController extends GetxController {
  final SimpananUseCase _simpananUseCase;

  final nominalTransferController = TextEditingController();
  final niaTransferController = TextEditingController();

  final passwordController = TextEditingController();

  final isPasswordInvisible = true.obs;
  int saldoSimpanan = 0;
  String idSaya = "";
  NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  TransferController(this._simpananUseCase);

  @override
  void onInit() {
    super.onInit();
    onGetArgumentPrevPage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onGetArgumentPrevPage() {
    final arg = Get.arguments;
    saldoSimpanan = arg[0];
    idSaya = arg[1];
  }

  void onPasswordVisible() =>
      isPasswordInvisible.value = !isPasswordInvisible.value;

  void onPressKirim() {
    var nominal = nominalTransferController.text;
    var nominalJumlah = currencyFormat.parse(nominal).toInt();
    var password = passwordController.text;
    var nia = niaTransferController.text;

    print(nominalJumlah);
    print(saldoSimpanan);

    if (nominal == "" && password == "" && nia == "") {
      Get.dialog(
        AppOkeDialog(
            onPressed: () => Get.back(),
            title: "Data Belum Lengkap!",
            content: "Lengkapi Data Sebelum Melanjutkan"),
      );
    } else {
      if (nominalJumlah < saldoSimpanan) {
        if (idSaya != nia) {
          Get.dialog(AppAlertDialog(
              onPressed: () => transferSimpanan(nominalJumlah, password, nia),
              title: "Perhatian!",
              content:
                  "Anda akan mengirimkan saldo simpanan sebesar $nominal kepada Nomor Induk Anggota $nia"));
        } else {
          Get.dialog(AppOkeDialog(
              onPressed: () => Get.back(),
              title: "Perhatian!",
              content: "Anda tidak bisa mengirim ke rekening anda sendiri"));
        }
      } else {
        Get.dialog(AppOkeDialog(
            onPressed: () => Get.back(),
            title: "Perhatian!",
            content: "Saldo anda tidak mencukupi"));
      }
    }
  }

  Future<void> transferSimpanan(
      int jumlah, String passAkun, String nomorIndukPenerima) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    final result = await _simpananUseCase.onPostSimpananData(
        token: token,
        tipeSimpananId: 3,
        jumlah: jumlah,
        tipeSimpanan: "sukarela",
        tanggalTransaksi: DateTime.now(),
        rekening: 'biasa',
        buktiBayar: null,
        tipeTransaksiId: 7,
        passAkun: passAkun,
        nomorIndukPenerima: nomorIndukPenerima);

    result.fold(
        (l) => {Get.snackbar('Error', l.message), print(l.message)},
        (r) => {
              if (r.success!)
                {
                  Get.dialog(AppOkeDialog(
                      onPressed: () => Get.offAllNamed('/home'),
                      title: "Berhasil!",
                      content:
                          "Berhasil melakukan Transfer dana antar anggota"))
                }
              else
                {
                  Get.dialog(AppOkeDialog(
                      onPressed: () => Get.back(),
                      title: "Gagal!",
                      content: r.message!))
                }
            });
  }
}
