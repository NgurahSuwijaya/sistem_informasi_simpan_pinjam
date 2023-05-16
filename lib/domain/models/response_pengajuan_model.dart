// To parse this JSON data, do
//
//     final responsePengajuanModel = responsePengajuanModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_pengajuana.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/tipe_jaminan_model.dart';

import 'bunga_pinjaman_model.dart';

ResponsePengajuanModel responsePengajuanModelFromJson(String str) =>
    ResponsePengajuanModel.fromJson(json.decode(str));

String responsePengajuanModelToJson(ResponsePengajuanModel data) =>
    json.encode(data.toJson());

class ResponsePengajuanModel extends Equatable {
  final bool success;
  final String message;
  final List<BungaPinjamanModel> bungaPinjaman;
  final List<TipeJaminanModel> tipeJaminan;

  ResponsePengajuanModel({
    required this.success,
    required this.message,
    required this.bungaPinjaman,
    required this.tipeJaminan,
  });

  factory ResponsePengajuanModel.fromJson(Map<String, dynamic> json) =>
      ResponsePengajuanModel(
        success: json["success"],
        message: json["message"],
        bungaPinjaman: List<BungaPinjamanModel>.from(
            json["bunga_pinjaman"].map((x) => BungaPinjamanModel.fromJson(x))),
        tipeJaminan: List<TipeJaminanModel>.from(
            json["tipe_jaminan"].map((x) => TipeJaminanModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "bunga_pinjaman":
            List<dynamic>.from(bungaPinjaman.map((x) => x.toJson())),
        "tipe_jaminan": List<dynamic>.from(tipeJaminan.map((x) => x.toJson())),
      };

  ResponsePengajuan toEntity() {
    return ResponsePengajuan(
        success,
        message,
        bungaPinjaman.map((e) => e.toEntity()).toList(),
        tipeJaminan.map((e) => e.toEntity()).toList());
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
