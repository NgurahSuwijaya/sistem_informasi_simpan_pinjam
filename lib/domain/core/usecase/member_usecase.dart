import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../entities/response_member.dart';
import '../../entities/response_post.dart';
import '../../entities/response_tagihan_angsuran.dart';
import '../../entities/response_tagihan_simpanan.dart';
import '../../entities/response_transaksi_saya.dart';
import '../error/failure.dart';
import '../repositories/member_repository.dart';

class MemberUseCase {
  final MemberRepository repository;

  MemberUseCase(this.repository);

  Future<Either<Failure, ResponseMember>> execute(
      {required String? token, required int? id}) {
    return repository.getMemberDatail(token: token, id: id);
  }

  Future<Either<Failure, ResponseTagihanAngsuran>> onGetTagihanPinjamanMember(
      {required String? token}) {
    return repository.getTagihanAngsuranMember(token: token);
  }

  Future<Either<Failure, ResponseTagihanSimpanan>> onGetTagihanSimpananWajib(
      {required String? token}) {
    return repository.getTagihanSimpananWajib(token: token);
  }

  Future<Either<Failure, ResponseTransaksiSaya>> onGetTransaksiSaya(
      {required String? token, required int page}) {
    return repository.getTransaksiSaya(token: token, page: page);
  }

  Future<Either<Failure, ResponsePost>> onSetKontrolPenarikan(
      {required String? token, required String? kontrol}) {
    return repository.setKontrolPenarikan(token: token, kontrol: kontrol);
  }

  Future<Either<Failure, ResponsePost>> onSetRekeningGiro(
      {required String? token, required int? kontrol}) {
    return repository.setRekeningGiro(token: token, kontrol: kontrol);
  }

  Future<Either<Failure, ResponsePost>> onUpdateProfile(
      {required String? token, required File photoProfile}) {
    return repository.updatePhotoProfile(
        token: token, photoProfile: photoProfile);
  }
}
