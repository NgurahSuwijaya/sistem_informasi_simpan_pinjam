// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/core/data/member_remote_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/member_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_transaksi_saya.dart';
import '../../entities/response_member.dart';
import '../error/exception.dart';

class MemberRepositoryImpl implements MemberRepository {
  final MemberDataSource memberDataSource;

  MemberRepositoryImpl(
    this.memberDataSource,
  );

  @override
  Future<Either<Failure, ResponseMember>> getMemberDatail(
      {String? token, int? id}) async {
    try {
      final result = await memberDataSource.onGetMemberdata(token, id);
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
  Future<Either<Failure, ResponseTagihanAngsuran>> getTagihanAngsuranMember(
      {required String? token}) async {
    try {
      final result =
          await memberDataSource.onGetTagihanAngsuranMemberData(token);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Tidak Memiliki Tagihan Angsuran Pinjaman'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponseTagihanSimpanan>> getTagihanSimpananWajib(
      {required String? token}) async {
    try {
      final result =
          await memberDataSource.onGetTagihanSimpananWajibData(token);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan server mohon dicoba kembali'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponseTransaksiSaya>> getTransaksiSaya(
      {String? token, int? page}) async {
    try {
      final result = await memberDataSource.onGetTransaksiSaya(token, page!);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan server mohon dicoba kembali'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePost>> setKontrolPenarikan(
      {required String? token, required String? kontrol}) async {
    try {
      final result =
          await memberDataSource.onSetKontrolPenarikan(token, kontrol!);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan server mohon dicoba kembali'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePost>> updatePhotoProfile(
      {required String? token, required File photoProfile}) async {
    try {
      final result =
          await memberDataSource.onUpdatePhotoProfile(token, photoProfile);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan server mohon dicoba kembali'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePost>> setRekeningGiro(
      {required String? token, required int? kontrol}) async {
    try {
      final result = await memberDataSource.onSetRekeningGiro(token, kontrol!);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('Kesalahan server mohon dicoba kembali'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
