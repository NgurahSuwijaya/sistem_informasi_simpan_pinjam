import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/data/auth_remote_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/interfaces/auth_repository_impl.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/auth_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/login_usecase.dart';

import '../../../../presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(Get.find()));
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(authDataSource: Get.find()));
    Get.lazyPut<LoginUsecase>(() => LoginUsecase(Get.find()));
    Get.lazyPut<LoginController>(
      () => LoginController(loginUsecase: Get.find()),
    );
  }
}
