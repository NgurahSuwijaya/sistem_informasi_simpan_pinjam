import 'package:SIMPIN/domain/core/usecase/my_notification_usecase.dart';
import 'package:SIMPIN/widget/app_ok_dialog.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/my_notification.dart';

class DetailNotificationController extends GetxController {
  final MyNotificationUseCase myNotificationUseCase;
  final title = ''.obs;
  final subject = ''.obs;
  final content = "".obs;
  final hasDetail = false.obs;
  final myAllNotification = Rx<MyNotification?>(null);
  final isLoadingData = false.obs;

  DetailNotificationController(this.myNotificationUseCase);

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

  Future<void> deleteNotification(MyNotification myNotification) async {
    isLoadingData.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await myNotificationUseCase.onDeleteNotification(
        token: token, id: myNotification.id!);
    result.fold(
        (l) => Get.snackbar("Error", l.message),
        (r) => {
              Get
                ..dialog(AppOkeDialog(
                    onPressed: (() => Get.offAllNamed('/home')),
                    title: "Berhasil",
                    content: "Notifikasi berhasil dihapus")),
              isLoadingData.value = false,
            });
  }
}
