import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../../domain/core/data/my_notification_data_source.dart';
import '../../../../domain/core/interfaces/my_notification_repository_impl.dart';
import '../../../../domain/core/repositories/my_notification_repository.dart';
import '../../../../domain/core/usecase/my_notification_usecase.dart';
import '../../../../presentation/detail_notification/controllers/detail_notification.controller.dart';

class DetailNotificationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<MyNotificationDataSource>(
        () => MyNotificationDataSourceImpl(Get.find()));
    Get.lazyPut<MyNotificationRepository>(
        () => MyNotificationRepositoryImpl(Get.find()));
    Get.lazyPut<MyNotificationUseCase>(() => MyNotificationUseCase(Get.find()));
    Get.lazyPut<DetailNotificationController>(
      () => DetailNotificationController(Get.find()),
    );
  }
}
