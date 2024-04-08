// To parse this JSON data, do
//
//     final responseKategoriPinjamanModel = responseKategoriPinjamanModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../entities/response_get_kategori_pinjaman.dart';
import 'kategori_pinjaman_model.dart';

ResponseKategoriPinjamanModel responseKategoriPinjamanModelFromJson(
        String str) =>
    ResponseKategoriPinjamanModel.fromJson(json.decode(str));

String responseKategoriPinjamanModelToJson(
        ResponseKategoriPinjamanModel data) =>
    json.encode(data.toJson());

class ResponseKategoriPinjamanModel extends Equatable {
  final bool success;
  final String message;
  final List<KategoriPinjamanModel> data;

  const ResponseKategoriPinjamanModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseKategoriPinjamanModel.fromJson(Map<String, dynamic> json) =>
      ResponseKategoriPinjamanModel(
        success: json["success"],
        message: json["message"],
        data: List<KategoriPinjamanModel>.from(
            json["data"].map((x) => KategoriPinjamanModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  ResponseKategoriPinjaman toEntity() {
    return ResponseKategoriPinjaman(
        success: success,
        message: message,
        data: data.map((e) => e.toEntity()).toList());
  }

  @override
  List<Object?> get props => [success, message, data];
}
