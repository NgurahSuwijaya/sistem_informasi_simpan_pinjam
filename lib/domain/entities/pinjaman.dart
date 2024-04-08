// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'bunga_pinjaman2.dart';
import 'tipe_jaminan.dart';

class Pinjaman extends Equatable {
  const Pinjaman({
    required this.id,
    required this.memberId,
    required this.adminId,
    required this.kategoriPinjamanId,
    required this.bungaPinjamanId,
    required this.tipeAngsuran,
    required this.tipeBungaPinjaman,
    required this.jumlah,
    required this.tipeJaminanId,
    required this.nilaiAsetJaminan,
    required this.namaAsetJaminan,
    required this.dokumenAsetJaminan,
    required this.tanggalPinjaman,
    required this.statusPinjaman,
    required this.kwitansi,
    required this.createdAt,
    required this.updatedAt,
    required this.tipeJaminan,
    required this.bungaPinjaman,
  });

  final int id;
  final int memberId;
  final int? adminId;
  final int? kategoriPinjamanId;
  final int? bungaPinjamanId;
  final String? tipeAngsuran;
  final String? tipeBungaPinjaman;
  final int? jumlah;
  final int? tipeJaminanId;
  final int? nilaiAsetJaminan;
  final String? namaAsetJaminan;
  final String? dokumenAsetJaminan;
  final DateTime? tanggalPinjaman;
  final String? statusPinjaman;
  final String? kwitansi;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TipeJaminan? tipeJaminan;
  final BungaPinjaman2? bungaPinjaman;

  @override
  List<Object?> get props => [
        id,
        memberId,
        adminId,
        kategoriPinjamanId,
        bungaPinjamanId,
        tipeAngsuran,
        tipeBungaPinjaman,
        jumlah,
        tipeJaminanId,
        nilaiAsetJaminan,
        namaAsetJaminan,
        dokumenAsetJaminan,
        tanggalPinjaman,
        statusPinjaman,
        kwitansi,
        createdAt,
        updatedAt,
        tipeJaminan,
        bungaPinjaman,
      ];
}
