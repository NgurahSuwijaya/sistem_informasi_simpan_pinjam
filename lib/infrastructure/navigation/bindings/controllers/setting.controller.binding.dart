import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../../domain/core/data/auth_remote_data_source.dart';
import '../../../../domain/core/data/member_remote_data_source.dart';
import '../../../../domain/core/interfaces/auth_repository_impl.dart';
import '../../../../domain/core/interfaces/member_repository_impl.dart';
import '../../../../domain/core/repositories/auth_repository.dart';
import '../../../../domain/core/repositories/member_repository.dart';
import '../../../../domain/core/usecase/login_usecase.dart';
import '../../../../domain/core/usecase/member_usecase.dart';
import '../../../../presentation/setting/controllers/setting.controller.dart';

class SettingControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<MemberDataSource>(() => MemberDataSourceImpl(Get.find()));
    Get.lazyPut<MemberRepository>(() => MemberRepositoryImpl(Get.find()));
    Get.lazyPut<MemberUseCase>(() => MemberUseCase(Get.find()));
    Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(Get.find()));
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(authDataSource: Get.find()));
    Get.lazyPut<AuthUsecase>(() => AuthUsecase(Get.find()));
    Get.lazyPut<SettingController>(
      () => SettingController(Get.find(), Get.find()),
    );
  }
}
