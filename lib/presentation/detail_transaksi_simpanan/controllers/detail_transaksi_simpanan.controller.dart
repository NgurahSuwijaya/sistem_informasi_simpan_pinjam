import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/core/usecase/simpanan_usecase.dart';
import '../../../domain/entities/institution.dart';
import '../../../domain/entities/member.dart';
import '../../../domain/entities/response_simpanan.dart';
import '../../../domain/entities/simpanan.dart';
import 'package:http/http.dart' as http;
import '../../../domain/entities/tipe_simpanan.dart';
import '../../../domain/entities/tipe_transaksi.dart';
import '../../../domain/entities/user.dart';

class DetailTransaksiSimpananController extends GetxController {
  final SimpananUseCase _simpananUseCase;

  final idSimpanan = 0.obs;
  final isSetoran = false.obs;
  final tipeTransaksi = "".obs;
  final isLoadingData = false.obs;
  final simpananSaya = Rx<ResponseSimpanan>(ResponseSimpanan(
      success: true,
      message: "",
      data: Simpanan(
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
      ),
      giroInstitusi: null,
      saldoAwalGiro: null,
      saldoBiasa: null,
      saldoGiro: null,
      saldoPokok: null,
      saldoWajib: null,
      maksPenarikan: null));

  DetailTransaksiSimpananController(this._simpananUseCase);
  @override
  void onInit() {
    super.onInit();
    getArgumentPrev();
    getSimpananData();
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
    idSimpanan.value = arg[0];
    print("idsimpanan = " + idSimpanan.value.toString());
    tipeTransaksi.value = arg[1];
  }

  Future<void> getSimpananData() async {
    isLoadingData.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await _simpananUseCase.onGetSimpananDetailData(
        token: token, idSimpanan: idSimpanan.value);
    result.fold(
        (l) => Get.snackbar("Error", l.message),
        (r) => {
              // print(r),
              simpananSaya.value = r,
              // print(simpananSaya),
              isLoadingData.value = false
            });
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

  Future<void> downloadFileBuktiKwitansi(String path) async {
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

  // Future<void> openDownloadedFile(String filePath) async {
  //   final file = File(filePath);

  //   if (await file.exists()) {
  //     // File exists, launch it using the default system app
  //     final Uri fileUri = Uri.file(file.path);
  //     await launchUrl(fileUri);
  //   } else {
  //     print('File not found: $filePath');
  //   }
  // }
}
