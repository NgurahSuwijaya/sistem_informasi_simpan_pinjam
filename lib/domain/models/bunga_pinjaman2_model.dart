import 'package:equatable/equatable.dart';

import '../entities/bunga_pinjaman2.dart';
import 'kategori_pinjaman_model.dart';

class BungaPinjaman2Model extends Equatable {
  final int id;
  final int kategoriPinjamanId;
  final int institutionId;
  final String? tipeAngsuran;
  final String? tipeBunga;
  final int? jangkaWaktu;
  final int? batasDurasiPinjamanBerjalan;
  final int? pinalti;
  final double? persentaseBunga;
  final int? biayaAdmin;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final KategoriPinjamanModel? kategoriPinjaman;

  const BungaPinjaman2Model({
    required this.id,
    required this.kategoriPinjamanId,
    required this.institutionId,
    required this.tipeAngsuran,
    required this.tipeBunga,
    required this.jangkaWaktu,
    required this.batasDurasiPinjamanBerjalan,
    required this.pinalti,
    required this.persentaseBunga,
    required this.biayaAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.kategoriPinjaman,
  });

  factory BungaPinjaman2Model.fromJson(Map<String, dynamic> json) =>
      BungaPinjaman2Model(
        id: json["id"],
        kategoriPinjamanId: json["kategori_pinjaman_id"],
        institutionId: json["institution_id"],
        tipeAngsuran: json["tipe_angsuran"],
        tipeBunga: json["tipe_bunga"],
        jangkaWaktu: json["jangka_waktu"],
        batasDurasiPinjamanBerjalan: json["batas_durasi_pinjaman_berjalan"],
        pinalti: json["pinalti"],
        persentaseBunga: json["persentase_bunga"]?.toDouble(),
        biayaAdmin: json["biaya_admin"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        kategoriPinjaman: json["kategori_pinjaman"] == null
            ? null
            : KategoriPinjamanModel.fromJson(json["kategori_pinjaman"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori_pinjaman_id": kategoriPinjamanId,
        "institution_id": institutionId,
        "tipe_angsuran": tipeAngsuran,
        "tipe_bunga": tipeBunga,
        "jangka_waktu": jangkaWaktu,
        "batas_durasi_pinjaman_berjalan": batasDurasiPinjamanBerjalan,
        "pinalti": pinalti,
        "persentase_bunga": persentaseBunga,
        "biaya_admin": biayaAdmin,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "kategori_pinjaman": kategoriPinjaman?.toJson(),
      };

  BungaPinjaman2 toEntity() {
    return BungaPinjaman2(
        id: id,
        kategoriPinjamanId: kategoriPinjamanId,
        institutionId: institutionId,
        tipeAngsuran: tipeAngsuran,
        tipeBunga: tipeBunga,
        jangkaWaktu: jangkaWaktu,
        batasDurasiPinjamanBerjalan: batasDurasiPinjamanBerjalan,
        pinalti: pinalti,
        persentaseBunga: persentaseBunga,
        biayaAdmin: biayaAdmin,
        createdAt: createdAt,
        updatedAt: updatedAt,
        kategoriPinjaman: kategoriPinjaman?.toEntity());
  }

  @override
  List<Object?> get props => [
        id,
        kategoriPinjamanId,
        institutionId,
        tipeAngsuran,
        tipeBunga,
        jangkaWaktu,
        batasDurasiPinjamanBerjalan,
        pinalti,
        persentaseBunga,
        biayaAdmin,
        createdAt,
        updatedAt,
        kategoriPinjaman
      ];
}
