import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/member_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';

class TagihanController extends GetxController {
  MemberUseCase memberUseCase;
  final isAdaTagihanAngsuran = false.obs;
  final isAdaTagihanSimpanan = false.obs;
  final Rx<ResponseTagihanAngsuran?> tagihanAngsuran =
      Rx<ResponseTagihanAngsuran?>(null);
  final Rx<ResponseTagihanSimpanan?> tagihanSimpanan =
      Rx<ResponseTagihanSimpanan?>(null);
  final isLoading = false.obs;

  TagihanController({
    required this.memberUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    getTagihanAngsuran();
    getTagihanSimpanan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getTagihanAngsuran() async {
    isLoading.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    final result = await memberUseCase.onGetTagihanPinjamanMember(token: token);
    result.fold(
        (left) => {
              Get.snackbar('Error angsuran', left.message),
              print(left.message),
              isAdaTagihanAngsuran.value = false,
              isLoading.value = false
            },
        (right) => {
              if (right.totalTagihan != 0 && right.totalTagihan != null)
                {
                  isAdaTagihanAngsuran.value = true,
                  tagihanAngsuran.value = right,
                  print(right.totalTagihan),
                  isLoading.value = false
                }
              else
                {isAdaTagihanAngsuran.value = false, isLoading.value = false}
            });
  }

  Future<void> getTagihanSimpanan() async {
    isLoading.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');

    final result = await memberUseCase.onGetTagihanSimpananWajib(token: token);

    result.fold(
        (l) => {
              Get.snackbar("Error simpanan", l.message),
              isAdaTagihanSimpanan.value = false
            },
        (r) => {
              if (r.totalTagihan != 0)
                {
                  isAdaTagihanSimpanan.value = true,
                  tagihanSimpanan.value = r,
                  // print(tagihanSimpanan.value),
                  isLoading.value = false
                }
              else
                {isAdaTagihanSimpanan.value = false, isLoading.value = false}
            });
  }
}
