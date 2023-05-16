import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/bank_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_bank.dart';

class GetBankData {
  final BankRepository _bankRepository;

  GetBankData(this._bankRepository);

  Future<Either<Failure, ResponseBank>> onGetBankData(
      {required String? token}) async {
    return _bankRepository.getBankData(token: token);
  }
}
