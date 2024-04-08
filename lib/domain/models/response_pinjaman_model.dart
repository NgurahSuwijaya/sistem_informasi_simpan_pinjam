import 'package:equatable/equatable.dart';
import '../entities/response_pinjaman.dart';
import 'pinjaman_model.dart';

class ResponsePinjamanModel extends Equatable {
  const ResponsePinjamanModel(
      {required this.success,
      required this.message,
      required this.data,
      required this.sisaPokok,
      required this.sisaBunga});

  final bool success;
  final String message;
  final PinjamanModel data;
  final int? sisaPokok;
  final int? sisaBunga;

  factory ResponsePinjamanModel.fromJson(Map<String, dynamic> json) =>
      ResponsePinjamanModel(
        success: json["success"],
        message: json["message"],
        data: PinjamanModel.fromJson(json["data"]),
        sisaBunga: json['sisa_bunga'],
        sisaPokok: json['sisa_pokok'],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
        "sisa_pokok": sisaPokok,
        "sisa_bunga": sisaBunga
      };

  ResponsePinjaman toEntity() {
    return ResponsePinjaman(
        success: success,
        message: message,
        data: data.toEntity(),
        sisaBunga: sisaBunga,
        sisaPokok: sisaPokok);
  }

  @override
  List<Object?> get props => [success, message, data, sisaPokok, sisaBunga];
}
