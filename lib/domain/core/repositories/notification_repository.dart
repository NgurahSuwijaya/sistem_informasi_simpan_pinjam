import 'package:dartz/dartz.dart';

import '../../entities/notification.dart';
import '../error/failure.dart';

abstract class NotificationRepository {
  Future<Either<Failure, void>> insertNotification(
      NotificationEntity notification);
  Future<Either<Failure, void>> updateNotification(
      NotificationEntity notification);
  Future<Either<Failure, void>> deleteNotification(int id);
  Future<Either<Failure, List<NotificationEntity>>> getAllNotifications();
}
