import 'dart:io';

import 'package:sistem_informasi_simpan_pinjam/domain/core/data/auth_remote_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/auth_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/login.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

import '../error/exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<Failure, Login>> loginUsers(
      {required String email,
      required String password,
      required String fcmToken}) async {
    try {
      final result =
          await authDataSource.onLoginUser(email, password, fcmToken);
      print(result);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Email atau Password Salah'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePost>> logOutUSer(String? token) async {
    try {
      final result = await authDataSource.onLogOutUser(token);
      print(result);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan server'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
