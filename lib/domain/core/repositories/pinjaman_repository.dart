import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_get_kategori_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pengajuana.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

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
}
