import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/my_notification.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

import '../error/failure.dart';

abstract class MyNotificationRepository {
  Future<Either<Failure, ResponseMyNotification>> getMyNotification(
      {required String? token, required int page});
  Future<Either<Failure, ResponsePost>> readNotification(
      {required String? token, required int id});
  Future<Either<Failure, ResponsePost>> deleteNotification(
      {required String? token, required int id});
}
