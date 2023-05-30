import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';
import '../../entities/response_member.dart';
import '../../entities/response_tagihan_angsuran.dart';
import '../error/failure.dart';

abstract class MemberRepository {
  Future<Either<Failure, ResponseMember>> getMemberDatail(
      {required String? token, required int? id});

  Future<Either<Failure, ResponseTagihanAngsuran>> getTagihanAngsuranMember(
      {required String? token});

  Future<Either<Failure, ResponseTagihanSimpanan>> getTagihanSimpananWajib(
      {required String? token});
}
