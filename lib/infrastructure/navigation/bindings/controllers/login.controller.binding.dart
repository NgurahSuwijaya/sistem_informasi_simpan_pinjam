import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../../domain/core/data/auth_remote_data_source.dart';
import '../../../../domain/core/interfaces/auth_repository_impl.dart';
import '../../../../domain/core/repositories/auth_repository.dart';
import '../../../../domain/core/usecase/login_usecase.dart';
import '../../../../presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<AuthDataSource>(() => AuthDataSourceImpl(Get.find()));
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(authDataSource: Get.find()));
    Get.lazyPut<AuthUsecase>(() => AuthUsecase(Get.find()));
    Get.lazyPut<LoginController>(
      () => LoginController(loginUsecase: Get.find()),
    );
  }
}
