import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/institution.dart';
import '../../../domain/core/usecase/member_usecase.dart';
import '../../../domain/entities/member.dart';
import '../../../domain/entities/user.dart';

class ProfileController extends GetxController {
  final GetMemberData _getMemberdata;
  RxBool isPasswordVisible = false.obs;
  final memberProfileData = Rx<Member>(Member(
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
  ));

  ProfileController(this._getMemberdata);

  final _isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMember();
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoading.value = true;
    final token = prefs.getString('token');
    final id = prefs.getInt('user_id');
    final result = await _getMemberdata.execute(token: token, id: id);

    result.fold((failure) {
      _isLoading.value = true;
      Get.snackbar('Error', failure.message);
      print(failure.message);
    }, (success) {
      _isLoading.value = false;
      memberProfileData.value = success.data;
      print(success.data.user.name);
    });
  }
}
