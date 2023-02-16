import 'package:get/get.dart';

import '../../../../presentation/pengajuan/controllers/pengajuan.controller.dart';

class PengajuanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanController>(
      () => PengajuanController(),
    );
  }
}
