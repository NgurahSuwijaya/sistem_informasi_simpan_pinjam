import 'package:get/get.dart';

import '../../../../presentation/pinjaman/controllers/pinjaman.controller.dart';

class PinjamanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinjamanController>(
      () => PinjamanController(),
    );
  }
}
