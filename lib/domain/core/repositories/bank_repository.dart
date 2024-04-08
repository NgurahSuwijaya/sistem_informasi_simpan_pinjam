import 'package:dartz/dartz.dart';

import '../../entities/response_bank.dart';
import '../error/failure.dart';

abstract class BankRepository {
  Future<Either<Failure, ResponseBank>> getBankData({String? token});
}
