import 'package:sistem_informasi_simpan_pinjam/domain/models/response_login_model.dart';

import '../../entities/user.dart';
import '../../models/user_model.dart';

abstract class UserRepository {
  Future<List<User>> getUser({String? token, int? id});
}
