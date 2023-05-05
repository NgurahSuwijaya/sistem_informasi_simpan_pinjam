import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_jaminan.dart';

import 'bunga_menetap.dart';
import 'bunga_menurun.dart';

class Pinjaman extends Equatable {
  Pinjaman({
    required this.id,
    required this.memberId,
    required this.adminId,
    this.bungaMenetapId,
    this.bungaMenurunId,
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
    this.bungaMenurun,
    this.bungaMenetap,
  });

  final int id;
  final int memberId;
  final int adminId;
  final int? bungaMenetapId;
  final int? bungaMenurunId;
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
  final TipeJaminan tipeJaminan;
  final BungaMenurun? bungaMenurun;
  final BungaMenetap? bungaMenetap;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        memberId,
        adminId,
        bungaMenetapId,
        bungaMenurunId,
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
        bungaMenurun,
        bungaMenetap
      ];
}
