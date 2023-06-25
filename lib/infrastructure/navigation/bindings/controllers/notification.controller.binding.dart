import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/data/my_notification_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/interfaces/my_notification_repository_impl.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/my_notification_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/my_notification_usecase.dart';

import '../../../../presentation/notification/controllers/notification.controller.dart';

class NotificationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<MyNotificationDataSource>(
        () => MyNotificationDataSourceImpl(Get.find()));
    Get.lazyPut<MyNotificationRepository>(
        () => MyNotificationRepositoryImpl(Get.find()));
    Get.lazyPut<MyNotificationUseCase>(() => MyNotificationUseCase(Get.find()));
    Get.lazyPut<NotificationController>(
      () => NotificationController(Get.find()),
    );
  }
}
