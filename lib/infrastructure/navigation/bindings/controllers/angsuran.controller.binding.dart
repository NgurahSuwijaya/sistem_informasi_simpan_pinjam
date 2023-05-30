import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/bank_usecase.dart';

import '../../../../domain/core/data/bank_remote_data_source.dart';
import '../../../../domain/core/interfaces/bank_repostory_impl.dart';
import '../../../../domain/core/repositories/bank_repository.dart';
import '../../../../presentation/angsuran/controllers/angsuran.controller.dart';

class AngsuranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<BankDataSource>(() => BankDataSourceImpl(Get.find()));
    Get.lazyPut<BankRepository>(() => BankRepositoryImpl(Get.find()));
    Get.lazyPut<GetBankData>(() => GetBankData(Get.find()));
    Get.lazyPut<AngsuranController>(
      () => AngsuranController(Get.find()),
    );
  }
}
