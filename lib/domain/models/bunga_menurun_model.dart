import 'package:equatable/equatable.dart';

import '../entities/bunga_menurun.dart';
import 'kategori_pinjaman_model.dart';

class BungaMenurunModel extends Equatable {
  BungaMenurunModel({
    required this.id,
    required this.kategoriPinjamanId,
    required this.institutionId,
    required this.batasDurasiPinjamanBerjalan,
    required this.persentaseBunga,
    required this.biayaAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.kategoriPinjaman,
  });

  final int id;
  final int kategoriPinjamanId;
  final int institutionId;
  final int batasDurasiPinjamanBerjalan;
  final double persentaseBunga;
  final double biayaAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final KategoriPinjamanModel kategoriPinjaman;

  factory BungaMenurunModel.fromJson(Map<String, dynamic> json) =>
      BungaMenurunModel(
        id: json["id"],
        kategoriPinjamanId: json["kategori_pinjaman_id"],
        institutionId: json["institution_id"],
        batasDurasiPinjamanBerjalan: json["batas_durasi_pinjaman_berjalan"],
        persentaseBunga: json["persentase_bunga"]?.toDouble(),
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
        "batas_durasi_pinjaman_berjalan": batasDurasiPinjamanBerjalan,
        "persentase_bunga": persentaseBunga,
        "biaya_admin": biayaAdmin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  BungaMenurun toEntity() {
    return BungaMenurun(
        id: id,
        institutionId: institutionId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        kategoriPinjamanId: kategoriPinjamanId,
        batasDurasiPinjamanBerjalan: batasDurasiPinjamanBerjalan,
        persentaseBunga: persentaseBunga,
        biayaAdmin: biayaAdmin,
        kategoriPinjaman: kategoriPinjaman.toEntity());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        kategoriPinjamanId,
        institutionId,
        batasDurasiPinjamanBerjalan,
        persentaseBunga,
        biayaAdmin,
        createdAt,
        updatedAt,
        kategoriPinjaman
      ];
}
