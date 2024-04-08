// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../entities/response_post.dart';
import '../../entities/response_simpanan.dart';
import '../../entities/response_tipe_simpanan.dart';
import '../data/simpanan_remote_data_source.dart';
import '../error/exception.dart';
import '../error/failure.dart';
import '../repositories/simpanan_repository.dart';

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
  Future<Either<Failure, ResponseTipeSimpanan>> getTipeSimpananData(
      {String? token}) async {
    try {
      final result = await simpananDataSource.onGetTipeSimpananData(token);
      // print(result);
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
  Future<Either<Failure, ResponsePost>> postSimpananData(
      {String? token,
      required int tipeSimpananId,
      required int tipeTransaksiId,
      required int jumlah,
      required String tipeSimpanan,
      required DateTime tanggalTransaksi,
      required String rekening,
      required File? buktiBayar,
      String? nomorIndukPenerima,
      String? passAkun}) async {
    try {
      final result = await simpananDataSource.onPostSimpananData(
          token,
          tipeSimpananId,
          tipeTransaksiId,
          jumlah,
          tipeSimpanan,
          tanggalTransaksi,
          rekening,
          buktiBayar,
          nomorIndukPenerima,
          passAkun);
      // print(result);
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
  Future<Either<Failure, ResponseSimpanan>> getDetailSimpananData(
      {required String? token, required int idSimpanan}) async {
    try {
      final result =
          await simpananDataSource.onGetDetailSimpananData(token, idSimpanan);
      // print(result);
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
  Future<Either<Failure, ResponsePost>> onIjinkanPenarikan(
      {required String? token, required int id}) async {
    try {
      final result = await simpananDataSource.onIjinkanPenarikan(token, id);
      // print(result);
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
  Future<Either<Failure, ResponsePost>> onTolakPenarikan(
      {required String? token, required int id}) async {
    try {
      final result = await simpananDataSource.onTolakPenarikan(token, id);
      // print(result);
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
