import 'package:equatable/equatable.dart';
import '../entities/simpanan.dart';
import 'member_model.dart';
import 'tipe_simpanan_model.dart';
import 'tipe_transaksi_model.dart';

class SimpananModel extends Equatable {
  const SimpananModel({
    required this.id,
    required this.institutionId,
    required this.memberId,
    required this.tipeSimpananId,
    required this.adminId,
    required this.tipeTransaksiId,
    required this.rekening,
    required this.metodeSimpanan,
    required this.jumlah,
    required this.saldo,
    required this.tanggalTransaksi,
    required this.buktiPembayaran,
    required this.verifiedAt,
    required this.statusTransaksi,
    required this.kwitansi,
    required this.createdAt,
    required this.updatedAt,
    required this.member,
    required this.tipeTransaksis,
    required this.tipeSimpanans,
  });

  final int id;
  final int institutionId;
  final int memberId;
  final int tipeSimpananId;
  final int? adminId;
  final int tipeTransaksiId;
  final String rekening;
  final String metodeSimpanan;
  final int jumlah;
  final int saldo;
  final DateTime tanggalTransaksi;
  final String? buktiPembayaran;
  final DateTime? verifiedAt;
  final String statusTransaksi;
  final String? kwitansi;
  final DateTime createdAt;
  final DateTime updatedAt;
  final MemberModel? member;
  final TipeTransaksisModel? tipeTransaksis;
  final TipeSimpanansModel? tipeSimpanans;

  factory SimpananModel.fromJson(Map<String, dynamic> json) => SimpananModel(
        id: json["id"],
        institutionId: json["institution_id"],
        memberId: json["member_id"],
        tipeSimpananId: json["tipe_simpanan_id"],
        adminId: json['admin_id'] == null ? null : json["admin_id"],
        tipeTransaksiId: json["tipe_transaksi_id"],
        rekening: json["rekening"],
        metodeSimpanan: json["metode_simpanan"],
        jumlah: json["jumlah"],
        saldo: json["saldo"],
        tanggalTransaksi: DateTime.parse(json["tanggal_transaksi"]),
        buktiPembayaran:
            json['bukti_pembayaran'] == null ? null : json["bukti_pembayaran"],
        verifiedAt: json['verified_at'] == null
            ? null
            : DateTime.parse(json["verified_at"]),
        statusTransaksi: json["status_transaksi"],
        kwitansi: json["kwitansi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        member: json["member"] == null
            ? null
            : MemberModel.fromJson(json["member"]),
        tipeTransaksis: json['tipe_transaksis'] == null
            ? null
            : TipeTransaksisModel.fromJson(json["tipe_transaksis"]),
        tipeSimpanans: json['tipe_simpanans'] == null
            ? null
            : TipeSimpanansModel.fromJson(json["tipe_simpanans"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "member_id": memberId,
        "tipe_simpanan_id": tipeSimpananId,
        "admin_id": adminId,
        "tipe_transaksi_id": tipeTransaksiId,
        "rekening": rekening,
        "metode_simpanan": metodeSimpanan,
        "jumlah": jumlah,
        "saldo": saldo,
        "tanggal_transaksi": tanggalTransaksi.toIso8601String(),
        "bukti_pembayaran": buktiPembayaran,
        "verified_at": verifiedAt?.toIso8601String(),
        "status_transaksi": statusTransaksi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "member": member?.toJson(),
        "tipe_transaksis": tipeTransaksis?.toJson(),
        "tipe_simpanans": tipeSimpanans?.toJson(),
      };

  Simpanan toEntity() {
    return Simpanan(
      id: id,
      institutionId: institutionId,
      memberId: memberId,
      tipeSimpananId: tipeSimpananId,
      adminId: adminId,
      tipeTransaksiId: tipeTransaksiId,
      rekening: rekening,
      metodeSimpanan: metodeSimpanan,
      jumlah: jumlah,
      saldo: saldo,
      tanggalTransaksi: tanggalTransaksi,
      buktiPembayaran: buktiPembayaran,
      verifiedAt: verifiedAt,
      statusTransaksi: statusTransaksi,
      kwitansi: kwitansi,
      createdAt: createdAt,
      updatedAt: updatedAt,
      member: member?.toEntity(),
      tipeTransaksis: tipeTransaksis?.toEntity(),
      tipeSimpanans: tipeSimpanans?.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        institutionId,
        memberId,
        tipeSimpananId,
        adminId,
        tipeTransaksiId,
        rekening,
        metodeSimpanan,
        jumlah,
        saldo,
        tanggalTransaksi,
        buktiPembayaran,
        verifiedAt,
        statusTransaksi,
        kwitansi,
        createdAt,
        updatedAt,
        member,
        tipeTransaksis,
        tipeSimpanans,
      ];
}
