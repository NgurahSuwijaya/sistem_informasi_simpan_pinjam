// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/core/data/simpanan_remote_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/simpanan_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_simpanan.dart';

import '../error/exception.dart';

class SimpananRepositoryImpl implements SimpananRepository {
  final SimpananDataSource simpananDataSource;

  SimpananRepositoryImpl({
    required this.simpananDataSource,
  });

  @override
  Future<Either<Failure, ResponseSimpanan>> getSimpananData({token}) async {
    try {
      final result = await simpananDataSource.onGetSimpananData(token);
      // print(result);
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
