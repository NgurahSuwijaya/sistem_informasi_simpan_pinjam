import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../../domain/core/data/angsuran_remote_data_source.dart';
import '../../../../domain/core/interfaces/angsuran_repository_impl.dart';
import '../../../../domain/core/repositories/angsuran_repository.dart';
import '../../../../domain/core/usecase/angsuran_usecase.dart';
import '../../../../presentation/detail_angsuran/controllers/detail_angsuran.controller.dart';

class DetailAngsuranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<AngsuranDataSource>(() => AngsuranDataSourceImpl(Get.find()));
    Get.lazyPut<AngsuranRepository>(() => AngsuranRepositoryImpl(Get.find()));
    Get.lazyPut<AngsuranUseCase>(() => AngsuranUseCase(Get.find()));
    Get.lazyPut<DetailAngsuranController>(
      () => DetailAngsuranController(Get.find()),
    );
  }
}
