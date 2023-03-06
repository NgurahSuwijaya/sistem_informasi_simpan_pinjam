import 'package:get/get.dart';

import '../../../../presentation/detail_angsuran/controllers/detail_angsuran.controller.dart';

class DetailAngsuranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAngsuranController>(
      () => DetailAngsuranController(),
    );
  }
}
