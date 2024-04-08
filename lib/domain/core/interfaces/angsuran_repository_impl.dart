import 'package:dartz/dartz.dart';
import 'dart:io';

import '../../entities/angsuran_pinjaman_detail.dart';
import '../../entities/response_post.dart';
import '../../entities/response_tagihan_angsuran.dart';
import '../data/angsuran_remote_data_source.dart';
import '../error/exception.dart';
import '../error/failure.dart';
import '../repositories/angsuran_repository.dart';

class AngsuranRepositoryImpl implements AngsuranRepository {
  final AngsuranDataSource angsuranDataSource;

  AngsuranRepositoryImpl(this.angsuranDataSource);

  @override
  Future<Either<Failure, AngsuranDetail>> onGetDetailAngsuran(
      {required String? token, required int id}) async {
    try {
      final result = await angsuranDataSource.onGetAngsuranDetail(token, id);
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
  Future<Either<Failure, ResponsePost>> onPostBayarAngsuran(
      {required String? token,
      required ResponseTagihanAngsuran responseTagihanAngsuran,
      required int jumlah,
      required File? buktiBayar}) async {
    try {
      final result = await angsuranDataSource.onPostBayarAngsuran(
          token, responseTagihanAngsuran, jumlah, buktiBayar);
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
