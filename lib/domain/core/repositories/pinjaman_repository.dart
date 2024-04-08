import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../entities/response_get_kategori_pinjaman.dart';
import '../../entities/response_pengajuana.dart';
import '../../entities/response_pinjaman.dart';
import '../../entities/response_post.dart';
import '../error/failure.dart';

abstract class PinjamanRepository {
  Future<Either<Failure, ResponsePinjaman>> getPinjamanData({String? token});
  Future<Either<Failure, ResponseKategoriPinjaman>> getKategoriPinjamanData(
      {String? token});

  Future<Either<Failure, ResponsePengajuan>> getPengajuanData(
      {String? token,
      required String tipeBunga,
      required String tipeAngsuran,
      required int kategoriPinjamanId});

  Future<Either<Failure, ResponsePost>> postPengajuanPinjamanData(
      {String? token,
      required String kategoriPinjamanId,
      required String bungaPinjamanId,
      required String tipeBungaPinjaman,
      required int jumlah,
      required String tipeJaminanId,
      required int nilaiAsetJaminan,
      required String namaAsetJaminan,
      required File? dokumenAsetJaminan,
      required String tipeAngsuran});

  Future<Either<Failure, ResponsePinjaman>> getDetailPinjamanData(
      {required String? token, required int id});
}
