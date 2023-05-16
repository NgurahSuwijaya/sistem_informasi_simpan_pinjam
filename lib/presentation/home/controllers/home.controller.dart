import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_transaksi.dart';
import '../../../domain/core/usecase/simpanan_usecase.dart';
import '../../../domain/entities/institution.dart';
import '../../../domain/entities/member.dart';
import '../../../domain/entities/user.dart';

class HomeController extends GetxController {
  final SimpananUseCase getSimpanandata;
  RxBool isPasswordVisible = false.obs;
  RxInt currentPageIndex = 0.obs;

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
  ));

  HomeController(this.getSimpanandata);

  final _isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSimpanan();
  }

  @override
  void onReady() {
    super.onReady();
    // Get.toNamed('/home');
  }

  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getSimpanan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoading.value = false;
    final token = prefs.getString('token');
    print(token);
    final result = await getSimpanandata.onGetSimpananData(token: token);

    result.fold((failure) {
      _isLoading.value = true;
      Get.snackbar('tai', failure.message);
      print(failure.message);
    }, (success) {
      _isLoading.value = false;
      simpananData.value = success.data;
      print(success.data.member.user.name);
    });
  }
}
