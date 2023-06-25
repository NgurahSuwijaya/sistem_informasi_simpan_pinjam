import '../../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser({String? token, int? id});
}
