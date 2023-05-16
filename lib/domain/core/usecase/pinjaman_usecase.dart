import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/error/failure.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/repositories/pinjaman_repository.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_get_kategori_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pengajuana.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';

class PinjamanUseCase {
  final PinjamanRepository _pinjamanRepository;

  PinjamanUseCase(this._pinjamanRepository);

  Future<Either<Failure, ResponsePinjaman>> onGetPinjamanData(
      {required String? token}) async {
    return _pinjamanRepository.getPinjamanData(token: token);
  }

  Future<Either<Failure, ResponseKategoriPinjaman>> onGetKategoriPinjaman(
      {required String? token}) async {
    return _pinjamanRepository.getKategoriPinjamanData(token: token);
  }

  Future<Either<Failure, ResponsePengajuan>> onGetPengajuanData(
      {required String? token,
      required String tipeBunga,
      required String tipeAngsuran,
      required int kategoriPinjamanId}) async {
    return _pinjamanRepository.getPengajuanData(
        token: token,
        tipeBunga: tipeBunga,
        tipeAngsuran: tipeAngsuran,
        kategoriPinjamanId: kategoriPinjamanId);
  }

  Future<Either<Failure, ResponsePost>> onPostPengajuanData(
      {required String? token,
      required String kategoriPinjamanId,
      required String bungaPinjamanId,
      required String tipeBungaPinjaman,
      required int jumlah,
      required String tipeJaminanId,
      required int nilaiAsetJaminan,
      required String namaAsetJaminan,
      required File? dokumenAsetJaminan,
      required String tipeAngsuran}) async {
    return _pinjamanRepository.postPengajuanPinjamanData(
        token: token,
        kategoriPinjamanId: kategoriPinjamanId,
        bungaPinjamanId: bungaPinjamanId,
        tipeBungaPinjaman: tipeBungaPinjaman,
        jumlah: jumlah,
        tipeJaminanId: tipeJaminanId,
        nilaiAsetJaminan: nilaiAsetJaminan,
        namaAsetJaminan: namaAsetJaminan,
        dokumenAsetJaminan: dokumenAsetJaminan,
        tipeAngsuran: tipeAngsuran);
  }
}
