import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../../domain/core/data/simpanan_remote_data_source.dart';
import '../../../../domain/core/interfaces/simpanan_repository_impl.dart';
import '../../../../domain/core/repositories/simpanan_repository.dart';
import '../../../../domain/core/usecase/simpanan_usecase.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<SimpananDataSource>(() => SimpananDataSourceImpl(Get.find()));
    Get.lazyPut<SimpananRepository>(
        () => SimpananRepositoryImpl(simpananDataSource: Get.find()));
    Get.lazyPut<SimpananUseCase>(() => SimpananUseCase(Get.find()));
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
