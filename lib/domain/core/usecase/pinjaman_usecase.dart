import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/pinjaman_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pinjaman.dart';

class GetPinjamanData {
  final PinjamanRepository _pinjamanRepository;

  GetPinjamanData(this._pinjamanRepository);

  Future<Either<Failure, ResponsePinjaman>> onGetPinjamanData(
      {required String? token}) async {
    return _pinjamanRepository.getPinjamanData(token: token);
  }
}
