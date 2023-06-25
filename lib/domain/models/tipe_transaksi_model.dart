import 'package:equatable/equatable.dart';

import '../entities/tipe_transaksi.dart';

class TipeTransaksisModel extends Equatable {
  const TipeTransaksisModel({
    required this.id,
    required this.institutionId,
    required this.name,
    required this.pengali,
    required this.perhitunganBunga,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int institutionId;
  final String name;
  final int pengali;
  final int perhitunganBunga;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory TipeTransaksisModel.fromJson(Map<String, dynamic> json) =>
      TipeTransaksisModel(
        id: json["id"],
        institutionId: json["institution_id"],
        name: json["name"],
        pengali: json["pengali"],
        perhitunganBunga: json["perhitungan_bunga"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "name": name,
        "pengali": pengali,
        "perhitungan_bunga": perhitunganBunga,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  TipeTransaksis toEntity() {
    return TipeTransaksis(
        id: id,
        institutionId: institutionId,
        name: name,
        pengali: pengali,
        perhitunganBunga: perhitunganBunga,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  @override
  List<Object?> get props => [
        id,
        institutionId,
        name,
        pengali,
        perhitunganBunga,
        createdAt,
        updatedAt,
      ];
}
