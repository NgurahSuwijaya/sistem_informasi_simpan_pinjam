import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../entities/response_bank.dart';

ResponseBankModel responseBankModelFromJson(String str) =>
    ResponseBankModel.fromJson(json.decode(str));

String responseBankModelToJson(ResponseBankModel data) =>
    json.encode(data.toJson());

class ResponseBankModel extends Equatable {
  final bool success;
  final String message;
  final List<BankModel> data;

  const ResponseBankModel({
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
  List<Object?> get props => [success, message, data];
}

class BankModel extends Equatable {
  final int id;
  final int institutionId;
  final String namaBank;
  final String nomorRekening;
  final String atasNama;

  const BankModel({
    required this.id,
    required this.institutionId,
    required this.namaBank,
    required this.nomorRekening,
    required this.atasNama,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        id: json["id"],
        institutionId: json["institution_id"],
        namaBank: json["nama_bank"],
        nomorRekening: json["nomor_rekening"],
        atasNama: json["atas_nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "nama_bank": namaBank,
        "nomor_rekening": nomorRekening,
        "atas_nama": atasNama,
      };

  Bank toEntity() {
    return Bank(
      id: id,
      institutionId: institutionId,
      namaBank: namaBank,
      nomorRekening: nomorRekening,
      atasNama: atasNama,
    );
  }

  @override
  List<Object?> get props => [
        id,
        institutionId,
        namaBank,
        nomorRekening,
        atasNama,
      ];
}
