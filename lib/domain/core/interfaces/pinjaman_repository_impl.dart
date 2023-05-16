import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_get_kategori_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pengajuana.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

import '../../entities/response_pinjaman.dart';
import '../data/pinjaman_remote_data_source.dart';
import '../error/exception.dart';
import '../error/failure.dart';
import '../repositories/pinjaman_repository.dart';

class PinjamanRepositoryImpl implements PinjamanRepository {
  final PinjamanDataSource pinjamanDataSource;

  PinjamanRepositoryImpl({
    required this.pinjamanDataSource,
  });

  @override
  Future<Either<Failure, ResponsePinjaman>> getPinjamanData({token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final result = await pinjamanDataSource.onGetPinjamanData(token);
      // print(result);
      return Right(result.toEntity());
    } on ServerException {
      prefs.setBool('punyaPinjaman', false);
      return Left(ServerFailure('Saat ini anda tidak dalam pinjaman'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponseKategoriPinjaman>> getKategoriPinjamanData(
      {String? token}) async {
    try {
      final result = await pinjamanDataSource.onGetKategoriPinjamanData(token);
      // print(result);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePengajuan>> getPengajuanData(
      {String? token,
      required String tipeBunga,
      required String tipeAngsuran,
      required int kategoriPinjamanId}) async {
    try {
      final result = await pinjamanDataSource.onGetPengajuanData(
          token, tipeBunga, tipeAngsuran, kategoriPinjamanId);
      // print(result);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePost>> postPengajuanPinjamanData(
      {String? token,
      required String kategoriPinjamanId,
      required String bungaPinjamanId,
      required String tipeBungaPinjaman,
      required int jumlah,
      required String tipeJaminanId,
      required int nilaiAsetJaminan,
      required String namaAsetJaminan,
      required File? dokumenAsetJaminan,
      required String tipeAngsuran}) async {
    try {
      final result = await pinjamanDataSource.onPostPengajuanData(
          token,
          kategoriPinjamanId,
          bungaPinjamanId,
          tipeBungaPinjaman,
          jumlah,
          tipeJaminanId,
          nilaiAsetJaminan,
          namaAsetJaminan,
          dokumenAsetJaminan,
          tipeAngsuran);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Server Error'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
