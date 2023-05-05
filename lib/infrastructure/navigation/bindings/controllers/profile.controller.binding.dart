import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/data/member_remote_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/interfaces/member_repository_impl.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/member_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/member_usecase.dart';
import '../../../../presentation/profile/controllers/profile.controller.dart';

class ProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<MemberDataSource>(() => MemberDataSourceImpl(Get.find()));
    Get.lazyPut<MemberRepository>(() => MemberRepositoryImpl(Get.find()));
    Get.lazyPut<GetMemberData>(() => GetMemberData(Get.find()));
    Get.lazyPut<ProfileController>(
      () => ProfileController(Get.find()),
    );
  }
}
