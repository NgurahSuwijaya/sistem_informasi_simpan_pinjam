import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/tipe_simpanan_model.dart';

import '../entities/response_tipe_simpanan.dart';

class ResponseTipeSimpananModel extends Equatable {
  final bool success;
  final String message;
  final List<TipeSimpanansModel> data;

  const ResponseTipeSimpananModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseTipeSimpananModel.fromJson(Map<String, dynamic> json) =>
      ResponseTipeSimpananModel(
        success: json["success"],
        message: json["message"],
        data: List<TipeSimpanansModel>.from(
            json["data"].map((x) => TipeSimpanansModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  ResponseTipeSimpanan toEntity() {
    return ResponseTipeSimpanan(
        success, message, data.map((e) => e.toEntity()).toList());
  }

  @override
  List<Object?> get props => [success, message, data];
}
