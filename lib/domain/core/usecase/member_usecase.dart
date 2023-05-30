import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/member_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/member.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';

import '../../entities/response_member.dart';
import '../error/failure.dart';

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
}
