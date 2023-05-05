import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_simpanan.dart';

abstract class SimpananRepository {
  Future<Either<Failure, ResponseSimpanan>> getSimpananData({String? token});
}
