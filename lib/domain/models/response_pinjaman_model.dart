import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/pinjaman_model.dart';

import '../entities/response_pinjaman.dart';

class ResponsePinjamanModel extends Equatable {
  ResponsePinjamanModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final PinjamanModel data;

  factory ResponsePinjamanModel.fromJson(Map<String, dynamic> json) =>
      ResponsePinjamanModel(
        success: json["success"],
        message: json["message"],
        data: PinjamanModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };

  ResponsePinjaman toEntity() {
    return ResponsePinjaman(
        success: success, message: message, data: data.toEntity());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
