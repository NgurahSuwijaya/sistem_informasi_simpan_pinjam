import 'package:get/get.dart';

import '../../../../presentation/detail_simpanan/controllers/detail_simpanan.controller.dart';

class DetailSimpananControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSimpananController>(
      () => DetailSimpananController(),
    );
  }
}
