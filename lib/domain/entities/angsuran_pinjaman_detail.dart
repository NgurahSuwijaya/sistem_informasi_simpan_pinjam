// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/entities/pinjaman.dart';

class AngsuranDetail extends Equatable {
  final bool? success;
  final String? message;
  final DataAngsuranDetail? data;

  const AngsuranDetail(this.success, this.message, this.data);

  @override
  List<Object?> get props => [success, message, data];
}

class DataAngsuranDetail extends Equatable {
  final int? id;
  final int? pinjamanId;
  final int? adminId;
  final String? metodeAngsuran;
  final String? buktiPembayaran;
  final DateTime? verifiedAt;
  final DateTime? tanggalTransaksi;
  final int? angsuranKe;
  final int? pokokBulanIni;
  final int? bungaBulanIni;
  final int? administrasiBulanIni;
  final int? pinaltiBulanIni;
  final int? tambahanPinjaman;
  final int? pembayaranPokok;
  final int? pembayaranBunga;
  final int? pembayaranAdministrasi;
  final int? pembayaranPenalti;
  final int? sisaPokok;
  final int? sisaBunga;
  final int? sisaAdministrasi;
  final int? sisaPinalti;
  final String? statusTransaksi;
  final String? kwitansi;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pinjaman? pinjaman;

  const DataAngsuranDetail(
      this.id,
      this.pinjamanId,
      this.adminId,
      this.metodeAngsuran,
      this.buktiPembayaran,
      this.verifiedAt,
      this.tanggalTransaksi,
      this.angsuranKe,
      this.pokokBulanIni,
      this.bungaBulanIni,
      this.administrasiBulanIni,
      this.pinaltiBulanIni,
      this.tambahanPinjaman,
      this.pembayaranPokok,
      this.pembayaranBunga,
      this.pembayaranAdministrasi,
      this.pembayaranPenalti,
      this.sisaPokok,
      this.sisaBunga,
      this.sisaAdministrasi,
      this.sisaPinalti,
      this.statusTransaksi,
      this.kwitansi,
      this.createdAt,
      this.updatedAt,
      this.pinjaman);

  @override
  List<Object?> get props => [
        id,
        pinjamanId,
        adminId,
        metodeAngsuran,
        buktiPembayaran,
        verifiedAt,
        tanggalTransaksi,
        angsuranKe,
        pokokBulanIni,
        bungaBulanIni,
        administrasiBulanIni,
        pinaltiBulanIni,
        tambahanPinjaman,
        pembayaranPokok,
        pembayaranBunga,
        pembayaranAdministrasi,
        pembayaranPenalti,
        sisaPokok,
        sisaBunga,
        sisaAdministrasi,
        sisaPinalti,
        statusTransaksi,
        kwitansi,
        createdAt,
        updatedAt,
        pinjaman,
      ];
}
