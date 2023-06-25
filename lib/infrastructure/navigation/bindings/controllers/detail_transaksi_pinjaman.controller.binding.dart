import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../../domain/core/data/pinjaman_remote_data_source.dart';
import '../../../../domain/core/interfaces/pinjaman_repository_impl.dart';
import '../../../../domain/core/repositories/pinjaman_repository.dart';
import '../../../../domain/core/usecase/pinjaman_usecase.dart';
import '../../../../presentation/detail_transaksi_pinjaman/controllers/detail_transaksi_pinjaman.controller.dart';

class DetailTransaksiPinjamanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<PinjamanDataSource>(() => PinjamanDataSourceImpl(Get.find()));
    Get.lazyPut<PinjamanRepository>(
        () => PinjamanRepositoryImpl(pinjamanDataSource: Get.find()));
    Get.lazyPut<PinjamanUseCase>(() => PinjamanUseCase(Get.find()));
    Get.lazyPut<DetailTransaksiPinjamanController>(
      () => DetailTransaksiPinjamanController(Get.find()),
    );
  }
}
