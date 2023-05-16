import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_bank.dart';

abstract class BankRepository {
  Future<Either<Failure, ResponseBank>> getBankData({String? token});
}
