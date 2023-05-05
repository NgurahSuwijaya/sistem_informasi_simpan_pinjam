import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/pinjaman_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/bunga_menetap.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/bunga_menurun.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/kategori_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_jaminan.dart';

class PinjamanController extends GetxController {
  final GetPinjamanData _getPinjamanData;
  final _isLoading = false.obs;
  final _isMeminjam = false.obs;

  final pinjamanData = Rx<Pinjaman>(Pinjaman(
      id: 0,
      memberId: 0,
      adminId: 0,
      tipeBungaPinjaman: '',
      jumlah: 0,
      tipeJaminanId: 0,
      nilaiAsetJaminan: 0,
      namaAsetJaminan: '',
      dokumenAsetJaminan: '',
      tanggalPinjaman: DateTime.now(),
      statusPinjaman: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      tipeJaminan: TipeJaminan(
          id: 0,
          namaTipeJaminan: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()),
      bungaMenurun: BungaMenurun(
          id: 0,
          institutionId: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          kategoriPinjamanId: 0,
          batasDurasiPinjamanBerjalan: 0,
          persentaseBunga: 0,
          biayaAdmin: 0,
          kategoriPinjaman: KategoriPinjaman(
              id: 0,
              institutionId: 0,
              name: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now())),
      bungaMenetap: BungaMenetap(
          id: 0,
          kategoriPinjamanId: 0,
          institutionId: 0,
          persentaseBunga: 0,
          jangkaWaktu: 0,
          pinalti: 0,
          biayaAdmin: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          kategoriPinjaman: KategoriPinjaman(
              id: 0,
              institutionId: 0,
              name: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now()))));

  PinjamanController(this._getPinjamanData);

  @override
  void onInit() {
    getPinjaman();
    super.onInit();
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
        _isMeminjam.value = true;
        _isLoading.value = false;
        preferences.setBool('punyaPinjaman', true);
      }
      print(failure.message);
    }, (success) {
      _isLoading.value = false;
      pinjamanData.value = success.data;
      print(pinjamanData.value.bungaMenurunId);
    });
  }
}
