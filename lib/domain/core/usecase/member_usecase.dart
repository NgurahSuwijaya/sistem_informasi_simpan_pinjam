import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/member_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/member.dart';

import '../../entities/response_member.dart';
import '../error/failure.dart';

class GetMemberData {
  final MemberRepository repository;

  GetMemberData(this.repository);

  Future<Either<Failure, ResponseMember>> execute(
      {required String? token, required int? id}) {
    return repository.getMemberDatail(token: token, id: id);
  }
}
