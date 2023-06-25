import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';

import 'tagihan_angsuran_model.dart';

class ResponseTagihanAngsuranModel extends Equatable {
  final bool success;
  final List<TagihanAngsuranModel>? tagihanAngsuran;
  final int? totalPokok;
  final int? totalBunga;
  final int? totalAdmin;
  final int? totalPenalti;
  final int? totalTagihan;

  const ResponseTagihanAngsuranModel({
    required this.success,
    this.tagihanAngsuran,
    required this.totalPokok,
    required this.totalBunga,
    required this.totalAdmin,
    required this.totalPenalti,
    required this.totalTagihan,
  });

  factory ResponseTagihanAngsuranModel.fromJson(Map<String, dynamic> json) =>
      ResponseTagihanAngsuranModel(
        success: json["success"],
        tagihanAngsuran: json["data"] == null
            ? []
            : List<TagihanAngsuranModel>.from(
                json["data"]!.map((x) => TagihanAngsuranModel.fromJson(x))),
        totalPokok: json["total_pokok"],
        totalBunga: json["total_bunga"],
        totalAdmin: json["total_admin"],
        totalPenalti: json["total_penalti"],
        totalTagihan: json["total_tagihan"],
      );

  ResponseTagihanAngsuran toEntity() {
    return ResponseTagihanAngsuran(
        success,
        tagihanAngsuran?.map((e) => e.toEntity()).toList(),
        totalPokok,
        totalBunga,
        totalAdmin,
        totalPenalti,
        totalTagihan);
  }

  @override
  List<Object?> get props => [
        success,
        tagihanAngsuran,
        totalPokok,
        totalBunga,
        totalAdmin,
        totalPenalti,
        totalTagihan
      ];
}
