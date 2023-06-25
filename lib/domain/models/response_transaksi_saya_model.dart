// To parse this JSON data, do
//
//     final responseTransaksiSayaModel = responseTransaksiSayaModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../entities/response_transaksi_saya.dart';

ResponseTransaksiSayaModel responseTransaksiSayaModelFromJson(String str) =>
    ResponseTransaksiSayaModel.fromJson(json.decode(str));

String responseTransaksiSayaModelToJson(ResponseTransaksiSayaModel data) =>
    json.encode(data.toJson());

class ResponseTransaksiSayaModel extends Equatable {
  final bool? success;
  final String? message;
  final DataModel? data;

  const ResponseTransaksiSayaModel({
    this.success,
    this.message,
    this.data,
  });

  factory ResponseTransaksiSayaModel.fromJson(Map<String, dynamic> json) =>
      ResponseTransaksiSayaModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };

  ResponseTransaksiSaya toEntity() {
    return ResponseTransaksiSaya(success, message, data!.toEntity());
  }

  @override
  List<Object?> get props => [success, message, data];
}

class DataModel extends Equatable {
  final int? currentPage;
  final List<TransaksiSayaModel>? data;
  final String? nextPageUrl;
  final int? to;
  final int? total;

  const DataModel({
    this.currentPage,
    this.data,
    this.nextPageUrl,
    this.to,
    this.total,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<TransaksiSayaModel>.from(
                json["data"]!.map((x) => TransaksiSayaModel.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "to": to,
        "total": total,
      };

  Data toEntity() => Data(currentPage, data!.map((e) => e.toEntity()).toList(),
      nextPageUrl, to, total);

  @override
  List<Object?> get props => [currentPage, data, to, total];
}

class TransaksiSayaModel extends Equatable {
  final int? id;
  final int? memberId;
  final int? simpananId;
  final int? pinjamanId;
  final dynamic angsuranId;
  final String? rekening;
  final String? tipeSimpanan;
  final DateTime? tanggalTransaksi;
  final dynamic angsuranKe;
  final int? pembayaranPokok;
  final int? pembayaranBunga;
  final int? pembayaranAdministrasi;
  final int? pembayaranPenalti;
  final String? tipeAngsuran;
  final String? tipeBungaPinjaman;
  final int? nilaiAsetJaminan;
  final String? namaAsetJaminan;
  final String? dokumenAsetJaminan;
  final String? buktiPembayaran;
  final dynamic metodeAngsuran;
  final int? jumlah;
  final String? statusTransaksi;
  final String? kwitansi;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? tipeTransaksiId;

  const TransaksiSayaModel(
      {this.id,
      this.memberId,
      this.simpananId,
      this.pinjamanId,
      this.angsuranId,
      this.rekening,
      this.tipeSimpanan,
      this.tanggalTransaksi,
      this.angsuranKe,
      this.pembayaranPokok,
      this.pembayaranBunga,
      this.pembayaranAdministrasi,
      this.pembayaranPenalti,
      this.tipeAngsuran,
      this.tipeBungaPinjaman,
      this.nilaiAsetJaminan,
      this.namaAsetJaminan,
      this.dokumenAsetJaminan,
      this.buktiPembayaran,
      this.metodeAngsuran,
      this.jumlah,
      this.statusTransaksi,
      this.kwitansi,
      this.createdAt,
      this.updatedAt,
      this.tipeTransaksiId});

  factory TransaksiSayaModel.fromJson(Map<String, dynamic> json) =>
      TransaksiSayaModel(
          id: json["id"],
          memberId: json["member_id"],
          simpananId: json["simpanan_id"],
          pinjamanId: json["pinjaman_id"],
          angsuranId: json["angsuran_id"],
          rekening: json["rekening"],
          tipeSimpanan: json["tipe_simpanan"],
          tanggalTransaksi: json["tanggal_transaksi"] == null
              ? null
              : DateTime.parse(json["tanggal_transaksi"]),
          angsuranKe: json["angsuran_ke"],
          pembayaranPokok: json["pembayaran_pokok"],
          pembayaranBunga: json["pembayaran_bunga"],
          pembayaranAdministrasi: json["pembayaran_administrasi"],
          pembayaranPenalti: json["pembayaran_penalti"],
          tipeAngsuran: json["tipe_angsuran"],
          tipeBungaPinjaman: json["tipe_bunga_pinjaman"],
          nilaiAsetJaminan: json["nilai_aset_jaminan"],
          namaAsetJaminan: json["nama_aset_jaminan"],
          dokumenAsetJaminan: json["dokumen_aset_jaminan"],
          buktiPembayaran: json["bukti_pembayaran"],
          metodeAngsuran: json["metode_angsuran"],
          jumlah: json["jumlah"],
          statusTransaksi: json["status_transaksi"],
          kwitansi: json["kwitansi"],
          createdAt: json["created_at"] == null
              ? null
              : DateTime.parse(json["created_at"]),
          updatedAt: json["updated_at"] == null
              ? null
              : DateTime.parse(json["updated_at"]),
          tipeTransaksiId: json['tipe_transaksi_id']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_id": memberId,
        "simpanan_id": simpananId,
        "pinjaman_id": pinjamanId,
        "angsuran_id": angsuranId,
        "rekening": rekening,
        "tipe_simpanan": tipeSimpanan,
        "tanggal_transaksi": tanggalTransaksi?.toIso8601String(),
        "angsuran_ke": angsuranKe,
        "pembayaran_pokok": pembayaranPokok,
        "pembayaran_bunga": pembayaranBunga,
        "pembayaran_administrasi": pembayaranAdministrasi,
        "pembayaran_penalti": pembayaranPenalti,
        "tipe_angsuran": tipeAngsuran,
        "tipe_bunga_pinjaman": tipeBungaPinjaman,
        "nilai_aset_jaminan": nilaiAsetJaminan,
        "nama_aset_jaminan": namaAsetJaminan,
        "dokumen_aset_jaminan": dokumenAsetJaminan,
        "bukti_pembayaran": buktiPembayaran,
        "metode_angsuran": metodeAngsuran,
        "jumlah": jumlah,
        "status_transaksi": statusTransaksi,
        "kwitansi": kwitansi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tipe_transaksi_id": tipeTransaksiId
      };

  TransaksiSaya toEntity() {
    return TransaksiSaya(
      id,
      memberId,
      simpananId,
      pinjamanId,
      angsuranId,
      rekening,
      tipeSimpanan,
      tanggalTransaksi,
      angsuranKe,
      pembayaranPokok,
      pembayaranBunga,
      pembayaranAdministrasi,
      pembayaranPenalti,
      tipeAngsuran,
      tipeBungaPinjaman,
      nilaiAsetJaminan,
      namaAsetJaminan,
      dokumenAsetJaminan,
      buktiPembayaran,
      metodeAngsuran,
      jumlah,
      statusTransaksi,
      kwitansi,
      createdAt,
      updatedAt,
      tipeTransaksiId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        memberId,
        simpananId,
        pinjamanId,
        angsuranId,
        rekening,
        tipeSimpanan,
        tanggalTransaksi,
        angsuranKe,
        pembayaranPokok,
        pembayaranBunga,
        pembayaranAdministrasi,
        pembayaranPenalti,
        tipeAngsuran,
        tipeBungaPinjaman,
        nilaiAsetJaminan,
        namaAsetJaminan,
        dokumenAsetJaminan,
        buktiPembayaran,
        metodeAngsuran,
        jumlah,
        statusTransaksi,
        kwitansi,
        createdAt,
        updatedAt,
        tipeTransaksiId,
      ];
}
