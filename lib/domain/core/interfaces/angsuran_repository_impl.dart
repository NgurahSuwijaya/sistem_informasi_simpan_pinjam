import 'package:dartz/dartz.dart';
import 'dart:io';

import 'package:sistem_informasi_simpan_pinjam/domain/core/data/angsuran_remote_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/angsuran_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/angsuran_pinjaman_detail.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

import '../error/exception.dart';

class AngsuranRepositoryImpl implements AngsuranRepository {
  final AngsuranDataSource angsuranDataSource;

  AngsuranRepositoryImpl(this.angsuranDataSource);

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
}
