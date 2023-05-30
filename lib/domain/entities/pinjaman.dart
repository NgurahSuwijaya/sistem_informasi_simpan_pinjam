// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_jaminan.dart';
import 'bunga_pinjaman2.dart';
import 'kategori_pinjaman.dart';

class Pinjaman extends Equatable {
  Pinjaman({
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
    required this.createdAt,
    required this.updatedAt,
    required this.tipeJaminan,
    required this.bungaPinjaman,
  });

  final int id;
  final int memberId;
  final int adminId;
  final int kategoriPinjamanId;
  final int bungaPinjamanId;
  final String tipeAngsuran;
  final String tipeBungaPinjaman;
  final int jumlah;
  final int tipeJaminanId;
  final int nilaiAsetJaminan;
  final String namaAsetJaminan;
  final String dokumenAsetJaminan;
  final DateTime tanggalPinjaman;
  final String statusPinjaman;
  final DateTime createdAt;
  final DateTime updatedAt;
  final TipeJaminan? tipeJaminan;
  final BungaPinjaman2? bungaPinjaman;

  @override
  // TODO: implement props
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
        createdAt,
        updatedAt,
        tipeJaminan,
        bungaPinjaman,
      ];
}
