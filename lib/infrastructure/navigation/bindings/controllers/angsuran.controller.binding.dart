import 'package:get/get.dart';

import '../../../../presentation/angsuran/controllers/angsuran.controller.dart';

class AngsuranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AngsuranController>(
      () => AngsuranController(),
    );
  }
}
