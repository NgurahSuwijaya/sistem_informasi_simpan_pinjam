import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/simpanan_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_simpanan.dart';

import '../../entities/response_tipe_simpanan.dart';

class SimpananUseCase {
  final SimpananRepository _simpananRepository;

  SimpananUseCase(this._simpananRepository);

  Future<Either<Failure, ResponseSimpanan>> onGetSimpananData(
      {required String? token}) async {
    return _simpananRepository.getSimpananData(token: token);
  }

  Future<Either<Failure, ResponseTipeSimpanan>> onGetTipeSimpananData(
      {required String? token}) async {
    return _simpananRepository.getTipeSimpananData(token: token);
  }

  Future<Either<Failure, ResponsePost>> onPostSimpananData(
      {required String? token,
      required int tipeTransaksiId,
      required int tipeSimpananId,
      required int jumlah,
      required String tipeSimpanan,
      required DateTime tanggalTransaksi,
      required String rekening,
      required File? buktiBayar}) async {
    return _simpananRepository.postSimpananData(
        token: token,
        tipeSimpananId: tipeSimpananId,
        jumlah: jumlah,
        tipeSimpanan: tipeSimpanan,
        tanggalTransaksi: tanggalTransaksi,
        rekening: rekening,
        buktiBayar: buktiBayar,
        tipeTransaksiId: tipeTransaksiId);
  }
}
