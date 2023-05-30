import 'package:equatable/equatable.dart';

import 'pinjaman.dart';

class AngsuranPinjamanTerakhir extends Equatable {
  final int id;
  final int pinjamanId;
  final int adminId;
  final String metodeAngsuran;
  // final dynamic buktiPembayaran;
  final DateTime verifiedAt;
  final DateTime tanggalTransaksi;
  final int angsuranKe;
  final int pokokBulanIni;
  final int bungaBulanIni;
  final int administrasiBulanIni;
  final int pinaltiBulanIni;
  final int tambahanPinjaman;
  final int pembayaranPokok;
  final int pembayaranBunga;
  final int pembayaranAdministrasi;
  final int pembayaranPenalti;
  final int sisaPokok;
  final int sisaBunga;
  final int sisaAdministrasi;
  final int sisaPinalti;
  final String statusTransaksi;
  // final dynamic kwitansi;
  final DateTime createdAt;
  final DateTime updatedAt;
  // final dynamic deletedAt;
  final Pinjaman pinjaman;

  const AngsuranPinjamanTerakhir(
      this.id,
      this.pinjamanId,
      this.adminId,
      this.metodeAngsuran,
      // this.buktiPembayaran,
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
      // this.kwitansi,
      this.createdAt,
      this.updatedAt,
      // this.deletedAt,
      this.pinjaman);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        pinjamanId,
        adminId,
        metodeAngsuran,
        // this.buktiPembayaran,
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
        // this.kwitansi,
        createdAt,
        updatedAt,
        // this.deletedAt,
        pinjaman
      ];
}
