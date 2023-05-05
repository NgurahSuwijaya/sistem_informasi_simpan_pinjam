import 'package:dartz/dartz.dart';
import '../../entities/response_member.dart';
import '../error/failure.dart';

abstract class MemberRepository {
  Future<Either<Failure, ResponseMember>> getMemberDatail(
      {required String? token, required int? id});
}
