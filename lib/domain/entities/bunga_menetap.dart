import 'package:equatable/equatable.dart';

import 'kategori_pinjaman.dart';

class BungaMenetap extends Equatable {
  const BungaMenetap({
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
  final KategoriPinjaman kategoriPinjaman;

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
