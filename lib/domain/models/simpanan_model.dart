import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/tipe_simpanan_model.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/tipe_transaksi_model.dart';
import 'member_model.dart';

class SimpananModel extends Equatable {
  SimpananModel({
    required this.id,
    required this.institutionId,
    required this.memberId,
    required this.tipeSimpananId,
    required this.adminId,
    required this.tipeTransaksiId,
    required this.metodeSimpanan,
    required this.jumlah,
    required this.saldo,
    required this.tanggalTransaksi,
    required this.buktiPembayaran,
    required this.verifiedAt,
    required this.statusTransaksi,
    required this.createdAt,
    required this.updatedAt,
    required this.member,
    required this.tipeTransaksis,
    required this.tipeSimpanans,
  });

  int id;
  int institutionId;
  int memberId;
  int tipeSimpananId;
  int adminId;
  int tipeTransaksiId;
  String metodeSimpanan;
  int jumlah;
  int saldo;
  DateTime tanggalTransaksi;
  String buktiPembayaran;
  DateTime verifiedAt;
  String statusTransaksi;
  DateTime createdAt;
  DateTime updatedAt;
  MemberModel member;
  TipeTransaksisModel tipeTransaksis;
  TipeSimpanansModel tipeSimpanans;

  factory SimpananModel.fromJson(Map<String, dynamic> json) => SimpananModel(
        id: json["id"],
        institutionId: json["institution_id"],
        memberId: json["member_id"],
        tipeSimpananId: json["tipe_simpanan_id"],
        adminId: json["admin_id"],
        tipeTransaksiId: json["tipe_transaksi_id"],
        metodeSimpanan: json["metode_simpanan"],
        jumlah: json["jumlah"],
        saldo: json["saldo"],
        tanggalTransaksi: DateTime.parse(json["tanggal_transaksi"]),
        buktiPembayaran: json["bukti_pembayaran"],
        verifiedAt: DateTime.parse(json["verified_at"]),
        statusTransaksi: json["status_transaksi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        member: MemberModel.fromJson(json["member"]),
        tipeTransaksis: TipeTransaksisModel.fromJson(json["tipe_transaksis"]),
        tipeSimpanans: TipeSimpanansModel.fromJson(json["tipe_simpanans"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "member_id": memberId,
        "tipe_simpanan_id": tipeSimpananId,
        "admin_id": adminId,
        "tipe_transaksi_id": tipeTransaksiId,
        "metode_simpanan": metodeSimpanan,
        "jumlah": jumlah,
        "saldo": saldo,
        "tanggal_transaksi": tanggalTransaksi.toIso8601String(),
        "bukti_pembayaran": buktiPembayaran,
        "verified_at": verifiedAt.toIso8601String(),
        "status_transaksi": statusTransaksi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "member": member.toJson(),
        "tipe_transaksis": tipeTransaksis.toJson(),
        "tipe_simpanans": tipeSimpanans.toJson(),
      };

  Simpanan toEntity() {
    return Simpanan(
      id: id,
      institutionId: institutionId,
      memberId: memberId,
      tipeSimpananId: tipeSimpananId,
      adminId: adminId,
      tipeTransaksiId: tipeTransaksiId,
      metodeSimpanan: metodeSimpanan,
      jumlah: jumlah,
      saldo: saldo,
      tanggalTransaksi: tanggalTransaksi,
      buktiPembayaran: buktiPembayaran,
      verifiedAt: verifiedAt,
      statusTransaksi: statusTransaksi,
      createdAt: createdAt,
      updatedAt: updatedAt,
      member: member.toEntity(),
      tipeTransaksis: tipeTransaksis.toEntity(),
      tipeSimpanans: tipeSimpanans.toEntity(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        institutionId,
        memberId,
        tipeSimpananId,
        adminId,
        tipeTransaksiId,
        metodeSimpanan,
        jumlah,
        saldo,
        tanggalTransaksi,
        buktiPembayaran,
        verifiedAt,
        statusTransaksi,
        createdAt,
        updatedAt,
        member,
        tipeTransaksis,
        tipeSimpanans,
      ];
}
