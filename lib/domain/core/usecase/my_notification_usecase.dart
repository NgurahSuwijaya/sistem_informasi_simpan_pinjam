import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/my_notification_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/my_notification.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

import '../error/failure.dart';

class MyNotificationUseCase {
  final MyNotificationRepository repository;

  MyNotificationUseCase(this.repository);

  Future<Either<Failure, ResponseMyNotification>> onGetTransaksiSaya(
      {required String? token, required int page}) {
    return repository.getMyNotification(token: token, page: page);
  }

  Future<Either<Failure, ResponsePost>> onReadNotification(
      {required String? token, required int id}) {
    return repository.readNotification(token: token, id: id);
  }

  Future<Either<Failure, ResponsePost>> onDeleteNotification(
      {required String? token, required int id}) {
    return repository.deleteNotification(token: token, id: id);
  }
}
