// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/core/data/member_remote_data_source.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/member_repository.dart';
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
}
