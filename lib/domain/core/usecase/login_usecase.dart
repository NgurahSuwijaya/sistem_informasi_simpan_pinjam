import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';
import '../../entities/login.dart';
import '../error/failure.dart';
import '../repositories/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<Either<Failure, Login>> onLoginUser(
      {required String email,
      required String password,
      required String fcmToken}) async {
    return _authRepository.loginUsers(
        email: email, password: password, fcmToken: fcmToken);
  }

  Future<Either<Failure, ResponsePost>> onLogOutUser(
      {required String? token}) async {
    return _authRepository.logOutUSer(token);
  }
}
