import 'package:get/get.dart';

import '../../../../presentation/simpanan/controllers/simpanan.controller.dart';

class SimpananControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimpananController>(
      () => SimpananController(),
    );
  }
}
