import 'package:dartz/dartz.dart';
import '../../entities/login.dart';
import '../../entities/response_post.dart';
import '../error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginUsers(
      {required String email,
      required String password,
      required String fcmToken});
  Future<Either<Failure, ResponsePost>> logOutUSer(String? token);
}
