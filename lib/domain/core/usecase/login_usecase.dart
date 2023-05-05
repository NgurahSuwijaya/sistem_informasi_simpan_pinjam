import 'package:dartz/dartz.dart';
import '../../entities/login.dart';
import '../../models/response_login_model.dart';
import '../error/failure.dart';
import '../repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  Future<Either<Failure, Login>> onLoginUser(
      {required String email, required String password}) async {
    return _authRepository.loginUsers(email: email, password: password);
  }
}
