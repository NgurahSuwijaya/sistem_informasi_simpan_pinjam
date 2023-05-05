import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/simpanan_model.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/user_model.dart';
import '../entities/member.dart';
import '../entities/response_simpanan.dart';
import '../entities/simpanan.dart';
import '../entities/tipe_simpanan.dart';
import '../entities/tipe_transaksi.dart';

// ResponseSimpananModel responseSimpananModelFromJson(String str) => ResponseSimpananModel.fromJson(json.decode(str));

// String responseSimpananModelToJson(ResponseSimpananModel data) => json.encode(data.toJson());

class ResponseSimpananModel extends Equatable {
  ResponseSimpananModel({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  SimpananModel data;

  factory ResponseSimpananModel.fromJson(Map<String, dynamic> json) =>
      ResponseSimpananModel(
        success: json["success"],
        message: json["message"],
        data: SimpananModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };

  ResponseSimpanan toEntity() {
    return ResponseSimpanan(
        success: success, message: message, data: data.toEntity());
  }

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
