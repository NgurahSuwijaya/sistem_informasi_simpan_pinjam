import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../entities/response_bank.dart';
import '../data/bank_remote_data_source.dart';
import '../error/exception.dart';
import '../error/failure.dart';
import '../repositories/bank_repository.dart';

class BankRepositoryImpl implements BankRepository {
  final BankDataSource memberDataSource;

  BankRepositoryImpl(
    this.memberDataSource,
  );

  @override
  Future<Either<Failure, ResponseBank>> getBankData({String? token}) async {
    try {
      final result = await memberDataSource.onGetBankData(token);
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
}
