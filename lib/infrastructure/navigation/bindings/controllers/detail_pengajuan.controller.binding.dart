import 'package:get/get.dart';

import '../../../../presentation/detail_pengajuan/controllers/detail_pengajuan.controller.dart';

class DetailPengajuanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPengajuanController>(
      () => DetailPengajuanController(),
    );
  }
}
