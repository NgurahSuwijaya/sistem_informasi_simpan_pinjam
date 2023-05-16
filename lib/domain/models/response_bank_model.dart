// To parse this JSON data, do
//
//     final responseBankModel = responseBankModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_bank.dart';

ResponseBankModel responseBankModelFromJson(String str) =>
    ResponseBankModel.fromJson(json.decode(str));

String responseBankModelToJson(ResponseBankModel data) =>
    json.encode(data.toJson());

class ResponseBankModel extends Equatable {
  final bool success;
  final String message;
  final List<BankModel> data;

  ResponseBankModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseBankModel.fromJson(Map<String, dynamic> json) =>
      ResponseBankModel(
        success: json["success"],
        message: json["message"],
        data: List<BankModel>.from(
            json["data"].map((x) => BankModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  ResponseBank toEntity() {
    return ResponseBank(
        success, message, data.map((e) => e.toEntity()).toList());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}

class BankModel extends Equatable {
  final int id;
  final int institutionId;
  final String namaBank;
  final String nomorRekening;
  final String atasNama;
  final DateTime createdAt;
  final DateTime updatedAt;

  BankModel({
    required this.id,
    required this.institutionId,
    required this.namaBank,
    required this.nomorRekening,
    required this.atasNama,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        id: json["id"],
        institutionId: json["institution_id"],
        namaBank: json["nama_bank"],
        nomorRekening: json["nomor_rekening"],
        atasNama: json["atas_nama"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "nama_bank": namaBank,
        "nomor_rekening": nomorRekening,
        "atas_nama": atasNama,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  Bank toEntity() {
    return Bank(
        id: id,
        institutionId: institutionId,
        namaBank: namaBank,
        nomorRekening: nomorRekening,
        atasNama: atasNama,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        institutionId,
        namaBank,
        nomorRekening,
        atasNama,
        createdAt,
        updatedAt
      ];
}
