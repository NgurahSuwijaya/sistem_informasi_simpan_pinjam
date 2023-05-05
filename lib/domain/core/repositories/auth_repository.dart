import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import '../../entities/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginUsers(
      {required String email, required String password});
}
