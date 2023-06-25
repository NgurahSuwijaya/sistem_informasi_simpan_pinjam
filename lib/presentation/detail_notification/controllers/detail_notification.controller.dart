import 'package:get/get.dart';

import '../../../domain/entities/my_notification.dart';

class DetailNotificationController extends GetxController {
  final title = ''.obs;
  final subject = ''.obs;
  final content = "".obs;
  final hasDetail = false.obs;
  final myAllNotification = Rx<MyNotification?>(null);

  @override
  void onInit() {
    super.onInit();
    getArgumentPrevPage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
    super.onClose();
  }

  void getArgumentPrevPage() {
    myAllNotification.value = Get.arguments;
  }
}
