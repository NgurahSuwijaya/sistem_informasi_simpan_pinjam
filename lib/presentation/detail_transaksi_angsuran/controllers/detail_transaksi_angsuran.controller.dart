import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/angsuran_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/angsuran_pinjaman_detail.dart';
import 'package:http/http.dart' as http;

class DetailTransaksiAngsuranController extends GetxController {
  final AngsuranUseCase angsuranUseCase;
  final id = 0.obs;
  final tipeTransaksi = "".obs;
  final isLoadingData = false.obs;
  final totalTransaksi = 0.obs;
  final angsuranSaya = Rx<AngsuranDetail?>(null);

  DetailTransaksiAngsuranController(this.angsuranUseCase);

  @override
  void onInit() {
    super.onInit();
    getArgumentPrev();
    getAngsuranDetailData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
    super.onClose();
  }

  void getArgumentPrev() {
    final arg = Get.arguments;
    id.value = arg[0];
    print("idangsuran = " + id.value.toString());
    tipeTransaksi.value = arg[1];
  }

  Future<void> getAngsuranDetailData() async {
    isLoadingData.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    final result =
        await angsuranUseCase.onGetAngsuranDetail(token: token, id: id.value);
    result.fold(
        (l) => Get.snackbar("Error", l.message),
        (r) => {
              angsuranSaya.value = r,
              isLoadingData.value = false,
              totalTransaksi.value =
                  angsuranSaya.value!.data!.pembayaranAdministrasi! +
                      angsuranSaya.value!.data!.pembayaranPokok! +
                      angsuranSaya.value!.data!.pembayaranBunga! +
                      angsuranSaya.value!.data!.pembayaranPenalti!
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

  Future<void> downloadFileBuktiBayar(String path) async {
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
        final savePath = '${appDirectory.path}/$date.jpg';

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
