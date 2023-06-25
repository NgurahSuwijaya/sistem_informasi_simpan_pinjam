import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/angsuran_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/angsuran_pinjaman_detail.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

import '../../entities/response_tagihan_angsuran.dart';

class AngsuranUseCase {
  final AngsuranRepository _angsuranRepository;

  AngsuranUseCase(this._angsuranRepository);

  Future<Either<Failure, ResponsePost>> onPostBayarAngsuran(
      {required String? token,
      required ResponseTagihanAngsuran responseTagihanAngsuran,
      required int jumlah,
      required File? buktiBayar}) async {
    return _angsuranRepository.onPostBayarAngsuran(
        token: token,
        responseTagihanAngsuran: responseTagihanAngsuran,
        jumlah: jumlah,
        buktiBayar: buktiBayar);
  }

  Future<Either<Failure, AngsuranDetail>> onGetAngsuranDetail(
      {required String? token, required int id}) async {
    return _angsuranRepository.onGetDetailAngsuran(token: token, id: id);
  }
}
