import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../../domain/core/data/bank_remote_data_source.dart';
import '../../../../domain/core/data/simpanan_remote_data_source.dart';
import '../../../../domain/core/interfaces/simpanan_repository_impl.dart';
import '../../../../domain/core/repositories/simpanan_repository.dart';
import '../../../../domain/core/usecase/simpanan_usecase.dart';
import '../../../../presentation/detail_simpanan_wajib/controllers/detail_simpanan_wajib.controller.dart';

class DetailSimpananWajibControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<SimpananDataSource>(() => SimpananDataSourceImpl(Get.find()));
    Get.lazyPut<BankDataSource>(() => BankDataSourceImpl(Get.find()));
    Get.lazyPut<SimpananRepository>(
        () => SimpananRepositoryImpl(simpananDataSource: Get.find()));
    Get.lazyPut<SimpananUseCase>(() => SimpananUseCase(Get.find()));
    Get.lazyPut<DetailSimpananWajibController>(
      () => DetailSimpananWajibController(Get.find()),
    );
  }
}
