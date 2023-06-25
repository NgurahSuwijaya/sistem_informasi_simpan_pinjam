// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final angsuranDetailModel = angsuranDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/angsuran_pinjaman_detail.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/models/pinjaman_model.dart';

AngsuranDetailModel angsuranDetailModelFromJson(String str) =>
    AngsuranDetailModel.fromJson(json.decode(str));

String angsuranDetailModelToJson(AngsuranDetailModel data) =>
    json.encode(data.toJson());

class AngsuranDetailModel extends Equatable {
  final bool? success;
  final String? message;
  final DataAngsuranDetailModel? data;

  const AngsuranDetailModel({
    this.success,
    this.message,
    this.data,
  });

  factory AngsuranDetailModel.fromJson(Map<String, dynamic> json) =>
      AngsuranDetailModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DataAngsuranDetailModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };

  AngsuranDetail toEntity() {
    return AngsuranDetail(success, message, data?.toEntity());
  }

  @override
  List<Object?> get props => [success, message, data];
}

class DataAngsuranDetailModel extends Equatable {
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
  final PinjamanModel? pinjaman;

  const DataAngsuranDetailModel({
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
    this.pinjaman,
  });

  factory DataAngsuranDetailModel.fromJson(Map<String, dynamic> json) =>
      DataAngsuranDetailModel(
        id: json["id"],
        pinjamanId: json["pinjaman_id"],
        adminId: json["admin_id"],
        metodeAngsuran: json["metode_angsuran"],
        buktiPembayaran: json["bukti_pembayaran"],
        verifiedAt: json["verified_at"] == null
            ? null
            : DateTime.parse(json["verified_at"]),
        tanggalTransaksi: json["tanggal_transaksi"] == null
            ? null
            : DateTime.parse(json["tanggal_transaksi"]),
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
        kwitansi: json["kwitansi"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pinjaman: json["pinjaman"] == null
            ? null
            : PinjamanModel.fromJson(json["pinjaman"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pinjaman_id": pinjamanId,
        "admin_id": adminId,
        "metode_angsuran": metodeAngsuran,
        "bukti_pembayaran": buktiPembayaran,
        "verified_at": verifiedAt?.toIso8601String(),
        "tanggal_transaksi": tanggalTransaksi?.toIso8601String(),
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
        "kwitansi": kwitansi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pinjaman": pinjaman?.toJson(),
      };

  DataAngsuranDetail toEntity() {
    return DataAngsuranDetail(
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
        pinjaman?.toEntity());
  }

  @override
  List<Object?> get props {
    return [
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
}
