import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';
import '../../entities/response_member.dart';
import '../../entities/response_post.dart';
import '../../entities/response_tagihan_angsuran.dart';
import '../../entities/response_transaksi_saya.dart';
import '../error/failure.dart';

abstract class MemberRepository {
  Future<Either<Failure, ResponseMember>> getMemberDatail(
      {required String? token, required int? id});

  Future<Either<Failure, ResponseTagihanAngsuran>> getTagihanAngsuranMember(
      {required String? token});

  Future<Either<Failure, ResponseTagihanSimpanan>> getTagihanSimpananWajib(
      {required String? token});

  Future<Either<Failure, ResponseTransaksiSaya>> getTransaksiSaya(
      {String? token, int page});

  Future<Either<Failure, ResponsePost>> setKontrolPenarikan(
      {required String? token, required String? kontrol});

  Future<Either<Failure, ResponsePost>> setRekeningGiro(
      {required String? token, required int? kontrol});

  Future<Either<Failure, ResponsePost>> updatePhotoProfile(
      {required String? token, required File photoProfile});
}
