import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pinjaman.dart';

abstract class PinjamanRepository {
  Future<Either<Failure, ResponsePinjaman>> getPinjamanData({String? token});
}
