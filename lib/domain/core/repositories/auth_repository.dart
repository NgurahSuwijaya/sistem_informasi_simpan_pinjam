import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';
import '../../entities/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginUsers(
      {required String email,
      required String password,
      required String fcmToken});
  Future<Either<Failure, ResponsePost>> logOutUSer(String? token);
}
