import 'package:get/get.dart';

import '../../../../presentation/angsuran_menetap/controllers/angsuran_menetap.controller.dart';

class AngsuranMenetapControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AngsuranMenetapController>(
      () => AngsuranMenetapController(),
    );
  }
}
