import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';

import '../../entities/notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, void>> insertNotification(
      NotificationEntity notification);
  Future<Either<Failure, void>> updateNotification(
      NotificationEntity notification);
  Future<Either<Failure, void>> deleteNotification(int id);
  Future<Either<Failure, List<NotificationEntity>>> getAllNotifications();
}
