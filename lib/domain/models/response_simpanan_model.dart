// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import '../entities/response_simpanan.dart';
import 'simpanan_model.dart';

class ResponseSimpananModel extends Equatable {
  const ResponseSimpananModel(
      {required this.saldoPokok,
      required this.saldoWajib,
      required this.success,
      required this.message,
      required this.data,
      required this.saldoGiro,
      required this.giroInstitusi,
      required this.saldoAwalGiro,
      required this.saldoBiasa,
      required this.maksPenarikan});

  final bool success;
  final String message;
  final int? saldoGiro;
  final int? saldoBiasa;
  final int? saldoPokok;
  final int? saldoWajib;
  final int? maksPenarikan;
  final int? saldoAwalGiro;
  final bool? giroInstitusi;
  final SimpananModel data;

  factory ResponseSimpananModel.fromJson(Map<String, dynamic> json) =>
      ResponseSimpananModel(
        success: json["success"],
        message: json["message"],
        saldoAwalGiro: json['saldo_awal_giro'],
        giroInstitusi: json['giro_institusi'] == 0 ? false : true,
        saldoGiro: json['saldo_giro'],
        saldoBiasa: json['saldo_biasa'],
        saldoPokok: json['saldo_pokok'],
        saldoWajib: json['saldo_wajib'],
        maksPenarikan: json['maks_penarikan'],
        data: SimpananModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };

  ResponseSimpanan toEntity() {
    return ResponseSimpanan(
        success: success,
        message: message,
        saldoAwalGiro: saldoAwalGiro,
        saldoBiasa: saldoBiasa,
        saldoGiro: saldoGiro,
        giroInstitusi: giroInstitusi,
        data: data.toEntity(),
        saldoPokok: saldoPokok,
        maksPenarikan: maksPenarikan,
        saldoWajib: saldoWajib);
  }

  @override
  List<Object?> get props {
    return [
      success,
      message,
      saldoGiro,
      saldoBiasa,
      saldoPokok,
      saldoWajib,
      saldoAwalGiro,
      giroInstitusi,
      maksPenarikan,
      data,
    ];
  }
}
