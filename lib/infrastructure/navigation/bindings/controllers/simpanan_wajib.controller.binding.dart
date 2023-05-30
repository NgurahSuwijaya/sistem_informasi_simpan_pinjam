import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../../domain/core/data/bank_remote_data_source.dart';
import '../../../../domain/core/interfaces/bank_repostory_impl.dart';
import '../../../../domain/core/repositories/bank_repository.dart';
import '../../../../domain/core/usecase/bank_usecase.dart';
import '../../../../presentation/simpanan_wajib/controllers/simpanan_wajib.controller.dart';

class SimpananWajibControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<BankDataSource>(() => BankDataSourceImpl(Get.find()));
    Get.lazyPut<BankRepository>(() => BankRepositoryImpl(Get.find()));
    Get.lazyPut<GetBankData>(() => GetBankData(Get.find()));
    Get.lazyPut<SimpananWajibController>(
      () => SimpananWajibController(Get.find()),
    );
  }
}
