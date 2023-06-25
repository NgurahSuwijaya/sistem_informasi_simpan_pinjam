import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/data/my_notification_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/my_notification_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/my_notification.dart';

import '../error/exception.dart';

class MyNotificationRepositoryImpl implements MyNotificationRepository {
  final MyNotificationDataSource myNotificationDataSource;

  MyNotificationRepositoryImpl(this.myNotificationDataSource);

  @override
  Future<Either<Failure, ResponsePost>> deleteNotification(
      {required String? token, required int id}) async {
    try {
      final result =
          await myNotificationDataSource.onDeleteNotification(token, id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponseMyNotification>> getMyNotification(
      {required String? token, required int page}) async {
    try {
      final result =
          await myNotificationDataSource.onGetMyNotification(token, page);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePost>> readNotification(
      {required String? token, required int id}) async {
    try {
      final result =
          await myNotificationDataSource.onReadNotification(token, id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan Server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
