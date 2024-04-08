import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../domain/core/usecase/pinjaman_usecase.dart';
import '../../../domain/entities/response_pinjaman.dart';

class DetailTransaksiPinjamanController extends GetxController {
  final PinjamanUseCase _pinjamanUseCase;
  final id = 0.obs;
  final tipeTransaksi = "".obs;
  final isLoadingData = false.obs;
  final pinjamanSaya = Rx<ResponsePinjaman?>(null);

  DetailTransaksiPinjamanController(this._pinjamanUseCase);

  @override
  void onInit() {
    super.onInit();
    getArgumentPrev();
    getPinjamanData();
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
    print("idsimpanan = " + id.value.toString());
    tipeTransaksi.value = arg[1];
  }

  Future<void> getPinjamanData() async {
    isLoadingData.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    final result =
        await _pinjamanUseCase.onGetPinjamanDetail(token: token, id: id.value);

    result.fold((l) => Get.snackbar("Error", l.message),
        (r) => {pinjamanSaya.value = r, isLoadingData.value = false});
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
