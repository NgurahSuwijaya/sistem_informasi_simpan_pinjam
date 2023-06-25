import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/data/local_data_source/notification_local_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/exception.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/notification_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/notification.dart';

import '../../models/notification_model.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final LocalNotificationDataSource localNotificationDataSource;

  NotificationRepositoryImpl(this.localNotificationDataSource);

  @override
  Future<Either<Failure, void>> deleteNotification(int id) async {
    try {
      final result = await localNotificationDataSource.deleteNotification(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>>
      getAllNotifications() async {
    try {
      final result = await localNotificationDataSource.getAllNotifications();
      final notificationEntities =
          result.map((model) => model.toEntity()).toList();
      return Right(notificationEntities);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> insertNotification(
      NotificationEntity notification) async {
    try {
      final result = await localNotificationDataSource
          .insertNotification(NotificationModel.fromEntity(notification));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateNotification(
      NotificationEntity notification) async {
    try {
      final result = await localNotificationDataSource
          .updateNotification(NotificationModel.fromEntity(notification));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
