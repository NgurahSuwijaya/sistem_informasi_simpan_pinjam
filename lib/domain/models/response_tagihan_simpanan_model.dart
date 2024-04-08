// To parse this JSON data, do
//
//     final responseTagihanSimpananModel = responseTagihanSimpananModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../entities/response_tagihan_simpanan.dart';

ResponseTagihanSimpananModel responseTagihanSimpananModelFromJson(String str) =>
    ResponseTagihanSimpananModel.fromJson(json.decode(str));

String responseTagihanSimpananModelToJson(ResponseTagihanSimpananModel data) =>
    json.encode(data.toJson());

class ResponseTagihanSimpananModel extends Equatable {
  final bool success;
  final List<TagihanSimpananModel> data;
  final int totalTagihan;

  const ResponseTagihanSimpananModel({
    required this.success,
    required this.data,
    required this.totalTagihan,
  });

  factory ResponseTagihanSimpananModel.fromJson(Map<String, dynamic> json) =>
      ResponseTagihanSimpananModel(
        success: json["success"],
        data: List<TagihanSimpananModel>.from(
            json["data"].map((x) => TagihanSimpananModel.fromJson(x))),
        totalTagihan: json["totalTagihan"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalTagihan": totalTagihan,
      };
  ResponseTagihanSimpanan toEntity() {
    return ResponseTagihanSimpanan(
        success, data.map((e) => e.toEntity()).toList(), totalTagihan);
  }

  @override
  List<Object?> get props => [success, data, totalTagihan];
}

class TagihanSimpananModel extends Equatable {
  final int id;
  final int memberId;
  final int jumlah;
  final String status;
  final DateTime jatuhTempo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TagihanSimpananModel({
    required this.id,
    required this.memberId,
    required this.jumlah,
    required this.status,
    required this.jatuhTempo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TagihanSimpananModel.fromJson(Map<String, dynamic> json) =>
      TagihanSimpananModel(
        id: json["id"],
        memberId: json["member_id"],
        jumlah: json["jumlah"],
        status: json["status"],
        jatuhTempo: DateTime.parse(json["jatuh_tempo"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_id": memberId,
        "jumlah": jumlah,
        "status": status,
        "jatuh_tempo": jatuhTempo.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
  TagihanSimpanan toEntity() {
    return TagihanSimpanan(
        id, memberId, jumlah, status, jatuhTempo, createdAt, updatedAt);
  }

  @override
  List<Object?> get props =>
      [id, memberId, jumlah, status, jatuhTempo, createdAt, updatedAt];
}
