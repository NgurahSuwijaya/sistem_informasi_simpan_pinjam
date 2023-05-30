import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/pinjaman_model.dart';

class AngsuranPinjamanTerakhirModel extends Equatable {
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
  final PinjamanModel pinjaman;

  AngsuranPinjamanTerakhirModel({
    required this.id,
    required this.pinjamanId,
    required this.adminId,
    required this.metodeAngsuran,
    // this.buktiPembayaran,
    required this.verifiedAt,
    required this.tanggalTransaksi,
    required this.angsuranKe,
    required this.pokokBulanIni,
    required this.bungaBulanIni,
    required this.administrasiBulanIni,
    required this.pinaltiBulanIni,
    required this.tambahanPinjaman,
    required this.pembayaranPokok,
    required this.pembayaranBunga,
    required this.pembayaranAdministrasi,
    required this.pembayaranPenalti,
    required this.sisaPokok,
    required this.sisaBunga,
    required this.sisaAdministrasi,
    required this.sisaPinalti,
    required this.statusTransaksi,
    // this.kwitansi,
    required this.createdAt,
    required this.updatedAt,
    // this.deletedAt,
    required this.pinjaman,
  });

  factory AngsuranPinjamanTerakhirModel.fromJson(Map<String, dynamic> json) =>
      AngsuranPinjamanTerakhirModel(
        id: json["id"],
        pinjamanId: json["pinjaman_id"],
        adminId: json["admin_id"],
        metodeAngsuran: json["metode_angsuran"],
        // buktiPembayaran: json["bukti_pembayaran"],
        verifiedAt: DateTime.parse(json["verified_at"]),
        tanggalTransaksi: DateTime.parse(json["tanggal_transaksi"]),
        angsuranKe: json["angsuran_ke"],
        pokokBulanIni: json["pokok_bulan_ini"],
        bungaBulanIni: json["bunga_bulan_ini"],
        administrasiBulanIni: json["administrasi_bulan_ini"],
        pinaltiBulanIni: json["pinalti_bulan_ini"],
        tambahanPinjaman: json["tambahan_pinjaman"],
        pembayaranPokok: json["pembayaran_pokok"],
        pembayaranBunga: json["pembayaran_bunga"],
        pembayaranAdministrasi: json["pembayaran_administrasi"],
        pembayaranPenalti: json["pembayaran_penalti"],
        sisaPokok: json["sisa_pokok"],
        sisaBunga: json["sisa_bunga"],
        sisaAdministrasi: json["sisa_administrasi"],
        sisaPinalti: json["sisa_pinalti"],
        statusTransaksi: json["status_transaksi"],
        // kwitansi: json["kwitansi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        // deletedAt: json["deleted_at"],
        pinjaman: PinjamanModel.fromJson(json["pinjaman"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pinjaman_id": pinjamanId,
        "admin_id": adminId,
        "metode_angsuran": metodeAngsuran,
        // "bukti_pembayaran": buktiPembayaran,
        "verified_at": verifiedAt.toIso8601String(),
        "tanggal_transaksi": tanggalTransaksi.toIso8601String(),
        "angsuran_ke": angsuranKe,
        "pokok_bulan_ini": pokokBulanIni,
        "bunga_bulan_ini": bungaBulanIni,
        "administrasi_bulan_ini": administrasiBulanIni,
        "pinalti_bulan_ini": pinaltiBulanIni,
        "tambahan_pinjaman": tambahanPinjaman,
        "pembayaran_pokok": pembayaranPokok,
        "pembayaran_bunga": pembayaranBunga,
        "pembayaran_administrasi": pembayaranAdministrasi,
        "pembayaran_penalti": pembayaranPenalti,
        "sisa_pokok": sisaPokok,
        "sisa_bunga": sisaBunga,
        "sisa_administrasi": sisaAdministrasi,
        "sisa_pinalti": sisaPinalti,
        "status_transaksi": statusTransaksi,
        // "kwitansi": kwitansi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        // "deleted_at": deletedAt,
        "pinjaman": pinjaman.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
