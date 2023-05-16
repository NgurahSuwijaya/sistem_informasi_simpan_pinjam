import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_simpanan.dart';

import '../../entities/response_tipe_simpanan.dart';

abstract class SimpananRepository {
  Future<Either<Failure, ResponseSimpanan>> getSimpananData({String? token});
  Future<Either<Failure, ResponseTipeSimpanan>> getTipeSimpananData(
      {String? token});
  Future<Either<Failure, ResponsePost>> postSimpananData(
      {String? token,
      required int tipeSimpananId,
      required int tipeTransaksiId,
      required int jumlah,
      required String tipeSimpanan,
      required DateTime tanggalTransaksi,
      required String rekening,
      required File? buktiBayar});
}
