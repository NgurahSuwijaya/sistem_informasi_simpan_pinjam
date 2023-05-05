import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/simpanan_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_simpanan.dart';

class GetSimpananData {
  final SimpananRepository _simpananRepository;

  GetSimpananData(this._simpananRepository);

  Future<Either<Failure, ResponseSimpanan>> onGetSimpananData(
      {required String? token}) async {
    return _simpananRepository.getSimpananData(token: token);
  }
}
