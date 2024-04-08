import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/usecase/login_usecase.dart';
import '../../../domain/core/usecase/member_usecase.dart';
import '../../../widget/app_alert_dialog.dart';
import '../../../widget/app_ok_dialog.dart';

class SettingController extends GetxController {
  final isLoading = false.obs;
  final AuthUsecase authUsecase;
  final MemberUseCase memberUseCase;
  final photoPath = "".obs;
  final nia = "".obs;
  final name = "".obs;
  final saldoGiro = 0.obs;
  final isRekeninGiro = false.obs;
  final isInstitusiRekeninGiro = false.obs;

  final kontrolPenarikanValue = false.obs;

  SettingController(this.authUsecase, this.memberUseCase);

  @override
  void onInit() {
    super.onInit();
    getArgumentPrevPage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getArgumentPrevPage() {
    final arg = Get.arguments;
    photoPath.value = arg[0];
    nia.value = arg[1];
    name.value = arg[2];
    kontrolPenarikanValue.value = arg[3] == 'mobile' ? true : false;
    saldoGiro.value = arg[4];
    isRekeninGiro.value = arg[5];
    isInstitusiRekeninGiro.value = arg[6];
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = false;
    final token = prefs.getString('token');
    await Future.delayed(Duration(milliseconds: 1000));
    final result = await authUsecase.onLogOutUser(token: token);

    result.fold((l) {
      isLoading.value = false;
      // Get.snackbar('logout error', l.message);
      print(l.message);
      Get.dialog(AppOkeDialog(title: "Logout Gagal!", content: l.message));
      // Get.offAllNamed('/login');
      // Get.back();
    }, (r) {
      isLoading.value = false;
      Get.dialog(AppOkeDialog(
        title: "Logout Berhasil!",
        content: "Anda telah keluar dari akun silahkan login kembali",
        onPressed: () => {clearSharedPreferences(), Get.offAllNamed('/login')},
      ));
    });
  }

  void onActiveRekeningGiro() {
    Get.dialog(AppAlertDialog(
        onPressed: () => Get.offAllNamed('/home'),
        title: "Rekening Giro",
        content:
            "Untuk mengaktifkan rekening giro anda harus melakukan setoran awal. Apakah anda ingin menuju ke menu simpanan ?"));
  }

  void onKontrolChange(bool value) => kontrolPenarikanValue.value = value;
  void onGiroChange(bool value) => isRekeninGiro.value = value;

  Future<void> setKontrolPenarikan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = false;
    final token = prefs.getString('token');
    if (!kontrolPenarikanValue.value) {
      final result = await memberUseCase.onSetKontrolPenarikan(
          token: token, kontrol: "tidak ada");
      result.fold(
          (l) => {
                Get.dialog(AppOkeDialog(
                  title: "Error",
                  content: l.message,
                  onPressed: (() => Get.back()),
                )),
                print(l.message)
              },
          (r) => Get.dialog(AppOkeDialog(
              onPressed: (() => Get.back()),
              title: "Berhasil",
              content: "Berhasil merubah kontrol penarikan mobile")));
    } else {
      final result = await memberUseCase.onSetKontrolPenarikan(
          token: token, kontrol: "mobile");
      result.fold(
          (l) => Get.dialog(AppOkeDialog(
                title: "Error",
                content: l.message,
                onPressed: (() => Get.back()),
              )),
          (r) => Get.dialog(AppOkeDialog(
              onPressed: (() => Get.back()),
              title: "Berhasil",
              content: "Berhasil merubah kontrol penarikan mobile")));
    }
  }

  Future<void> setRekeningGiro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = false;
    final token = prefs.getString('token');
    final result = await memberUseCase.onSetRekeningGiro(
        token: token, kontrol: isRekeninGiro.value ? 1 : 0);
    result.fold(
        (l) => Get.dialog(AppOkeDialog(
              title: "Error",
              content: l.message,
              onPressed: (() => Get.back()),
            )),
        (r) => Get.dialog(AppOkeDialog(
            onPressed: (() => Get.back()),
            title: "Berhasil",
            content: "Berhasil merubah layanan rekening giro")));
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void setOnNotification(bool value) async {
    print(value);

    if (value) {
      var status = await Permission.notification.status;
      // print(status);
      if (!status.isGranted) {
        if (status.isDenied || status.isPermanentlyDenied) {
          await Permission.notification.request();

          // Check the permission status again after the request
          status = await Permission.notification.status;
          print(status);
        }
        if (!status.isGranted) {
          Get.snackbar(
              'Permission denied', 'Please grant notification permission');
          return;
        }
      }
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isNotification", value);
  }
}
