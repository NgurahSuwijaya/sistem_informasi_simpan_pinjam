import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../entities/response_post.dart';
import '../../entities/response_simpanan.dart';
import '../../entities/response_tipe_simpanan.dart';
import '../error/failure.dart';

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
      required File? buktiBayar,
      String? nomorIndukPenerima,
      String? passAkun});
  Future<Either<Failure, ResponseSimpanan>> getDetailSimpananData(
      {required String? token, required int idSimpanan});
  Future<Either<Failure, ResponsePost>> onIjinkanPenarikan(
      {required String? token, required int id});
  Future<Either<Failure, ResponsePost>> onTolakPenarikan(
      {required String? token, required int id});
}
