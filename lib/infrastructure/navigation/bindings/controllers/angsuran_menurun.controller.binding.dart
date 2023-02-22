import 'package:get/get.dart';

import '../../../../presentation/angsuran_menurun/controllers/angsuran_menurun.controller.dart';

class AngsuranMenurunControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AngsuranMenurunController>(
      () => AngsuranMenurunController(),
    );
  }
}
