import 'dart:io';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../domain/core/usecase/pinjaman_usecase.dart';
import '../../../domain/entities/pinjaman.dart';

class PinjamanController extends GetxController {
  final PinjamanUseCase _getPinjamanData;
  final _isLoading = false.obs;
  final _isMeminjam = false.obs;
  final sisaPokok = 1.obs;
  final sisaBunga = 1.obs;
  final pinjamanData = Rx<Pinjaman?>(null);
  // Pinjaman(
  //   id: 0,
  //   memberId: 0,
  //   adminId: 0,
  //   tipeBungaPinjaman: '',
  //   jumlah: 0,
  //   tipeJaminanId: 0,
  //   nilaiAsetJaminan: 0,
  //   namaAsetJaminan: '',
  //   dokumenAsetJaminan: '',
  //   tanggalPinjaman: DateTime.now(),
  //   statusPinjaman: "",
  //   createdAt: DateTime.now(),
  //   updatedAt: DateTime.now(),
  //   tipeJaminan: TipeJaminan(
  //       id: 0,
  //       namaTipeJaminan: '',
  //       createdAt: DateTime.now(),
  //       updatedAt: DateTime.now()),
  //   bungaPinjaman: BungaPinjaman2(
  //       id: 0,
  //       kategoriPinjamanId: 0,
  //       institutionId: 0,
  //       tipeAngsuran: '',
  //       tipeBunga: '',
  //       jangkaWaktu: '',
  //       batasDurasiPinjamanBerjalan: 0,
  //       pinalti: 0,
  //       persentaseBunga: 0,
  //       biayaAdmin: 0,
  //       createdAt: DateTime.now(),
  //       updatedAt: DateTime.now(),
  //       kategoriPinjaman: KategoriPinjaman(
  //           id: 0,
  //           institutionId: 0,
  //           name: '',
  //           createdAt: DateTime.now(),
  //           updatedAt: DateTime.now())),
  //   bungaPinjamanId: 0,
  //   kategoriPinjamanId: 0,
  //   // tipeAngsuran: '',
  // )

  PinjamanController(this._getPinjamanData);

  @override
  void onInit() {
    super.onInit();
    getPinjaman();
    initializeDateFormatting('id_ID', null);
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool get isLoading => _isLoading.value;
  bool get isMeminjam => _isMeminjam.value;

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getPinjaman() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isLoading.value = true;
    final token = preferences.getString('token');
    final statusPinjaman = preferences.getBool('punyaPinjaman');
    final result = await _getPinjamanData.onGetPinjamanData(token: token);

    result.fold((failure) {
      _isLoading.value = true;
      Get.snackbar('Status', failure.message);
      if (statusPinjaman != true) {
        _isMeminjam.value = false;
        _isLoading.value = false;
      }
      print(failure.message);
    }, (success) {
      _isLoading.value = false;
      _isMeminjam.value = true;
      pinjamanData.value = success.data;
      sisaPokok.value = success.sisaPokok!;
      sisaBunga.value = success.sisaBunga!;
      print(pinjamanData.value);
    });
  }

  Future<void> downloadFile(String path) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final url = 'http://10.0.2.2:8000$path';
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        final date = DateTime.now();
        final appDirectory = await getApplicationDocumentsDirectory();
        final savePath = '${appDirectory.path}/$date.pdf';

        final file = File(savePath);
        await file.writeAsBytes(bytes);
        Get.snackbar("Pemberitahuan", "File Berhasil di unduh");
        print('File berhasil diunduh: $savePath');
        final result = await OpenFile.open(savePath);
        if (result.type == ResultType.error) {
          print('Failed to open file: ${result.message}');
        } else {
          print('File opened successfully');
        }
      } else {
        Get.snackbar(
            "Gagal mengunduh file", "Gagal melakukan pengunduhan file");
      }
    } else {
      Get.snackbar("Error", "Ijin penggunaan penyimpanan tidak diberikan");
    }
  }
}
