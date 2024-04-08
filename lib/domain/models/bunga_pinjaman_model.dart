import 'package:equatable/equatable.dart';

import '../entities/bunga_pinjaman.dart';

class BungaPinjamanModel extends Equatable {
  final int id;
  final String? jangkaWaktu;
  final double? persentaseBunga;
  final int? batasDurasiPinjamanBerjalan;
  final int? jangkaWaktuInt;

  const BungaPinjamanModel({
    this.batasDurasiPinjamanBerjalan,
    required this.id,
    this.jangkaWaktu,
    this.persentaseBunga,
    this.jangkaWaktuInt,
  });

  factory BungaPinjamanModel.fromJson(Map<String, dynamic> json) =>
      BungaPinjamanModel(
        id: json["id"],
        batasDurasiPinjamanBerjalan: json['batas_durasi_pinjaman_berjalan'],
        jangkaWaktu: json["jangka_waktu"],
        persentaseBunga: json["persentase_bunga"]?.toDouble(),
        jangkaWaktuInt: json["jangka_waktu_int"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jangka_waktu": jangkaWaktu,
        'batas_durasi_pinjaman_berjalan': batasDurasiPinjamanBerjalan,
        "persentase_bunga": persentaseBunga,
        "jangka_waktu_int": jangkaWaktuInt,
      };

  BungaPinjaman toEntity() {
    return BungaPinjaman(id, jangkaWaktu, persentaseBunga, jangkaWaktuInt,
        batasDurasiPinjamanBerjalan);
  }

  @override
  List<Object?> get props => [id, jangkaWaktu, persentaseBunga, jangkaWaktu];
}
