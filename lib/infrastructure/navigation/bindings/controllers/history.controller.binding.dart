import 'package:get/get.dart';

import '../../../../presentation/history/controllers/history.controller.dart';

class HistoryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
  }
}
