import 'package:dartz/dartz.dart';

import '../../entities/notification.dart';
import '../error/failure.dart';
import '../repositories/notification_repository.dart';

class NotificationUseCase {
  final NotificationRepository _notificationRepository;

  NotificationUseCase(this._notificationRepository);

  Future<Either<Failure, List<NotificationEntity>>>
      onGetAllNotification() async {
    return _notificationRepository.getAllNotifications();
  }

  Future<Either<Failure, void>> onInsertNotification(
      NotificationEntity notification) async {
    return _notificationRepository.insertNotification(notification);
  }

  Future<Either<Failure, void>> onUpdateNotification(
      NotificationEntity notification) async {
    return _notificationRepository.updateNotification(notification);
  }

  Future<Either<Failure, void>> onDeleteNotification(int id) async {
    return _notificationRepository.deleteNotification(id);
  }
}
