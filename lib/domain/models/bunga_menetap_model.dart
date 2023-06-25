import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/bunga_menetap.dart';

import 'kategori_pinjaman_model.dart';

class BungaMenetapModel extends Equatable {
  const BungaMenetapModel({
    required this.id,
    required this.kategoriPinjamanId,
    required this.institutionId,
    required this.persentaseBunga,
    required this.jangkaWaktu,
    required this.pinalti,
    required this.biayaAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.kategoriPinjaman,
  });

  final int id;
  final int kategoriPinjamanId;
  final int institutionId;
  final double persentaseBunga;
  final int jangkaWaktu;
  final double pinalti;
  final double biayaAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final KategoriPinjamanModel kategoriPinjaman;

  factory BungaMenetapModel.fromJson(Map<String, dynamic> json) =>
      BungaMenetapModel(
        id: json["id"],
        kategoriPinjamanId: json["kategori_pinjaman_id"],
        institutionId: json["institution_id"],
        persentaseBunga: json["persentase_bunga"]?.toDouble(),
        jangkaWaktu: json["jangka_waktu"],
        pinalti: json["pinalti"]?.toDouble(),
        biayaAdmin: json["biaya_admin"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        kategoriPinjaman:
            KategoriPinjamanModel.fromJson(json["kategori_pinjaman"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori_pinjaman_id": kategoriPinjamanId,
        "institution_id": institutionId,
        "persentase_bunga": persentaseBunga,
        "jangka_waktu": jangkaWaktu,
        "pinalti": pinalti,
        "biaya_admin": biayaAdmin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "kategori_pinjaman": kategoriPinjaman.toJson(),
      };

  BungaMenetap toEntity() {
    return BungaMenetap(
        id: id,
        kategoriPinjamanId: kategoriPinjamanId,
        institutionId: institutionId,
        persentaseBunga: persentaseBunga,
        jangkaWaktu: jangkaWaktu,
        pinalti: pinalti,
        biayaAdmin: biayaAdmin,
        createdAt: createdAt,
        updatedAt: updatedAt,
        kategoriPinjaman: kategoriPinjaman.toEntity());
  }

  @override
  List<Object?> get props => [
        id,
        kategoriPinjamanId,
        institutionId,
        persentaseBunga,
        jangkaWaktu,
        pinalti,
        biayaAdmin,
        createdAt,
        updatedAt,
        kategoriPinjaman
      ];
}
