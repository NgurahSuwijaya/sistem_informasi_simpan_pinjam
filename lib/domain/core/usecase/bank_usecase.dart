import 'package:dartz/dartz.dart';
import '../../entities/response_bank.dart';
import '../error/failure.dart';
import '../repositories/bank_repository.dart';

class GetBankData {
  final BankRepository _bankRepository;

  GetBankData(this._bankRepository);

  Future<Either<Failure, ResponseBank>> onGetBankData(
      {required String? token}) async {
    return _bankRepository.getBankData(token: token);
  }
}
