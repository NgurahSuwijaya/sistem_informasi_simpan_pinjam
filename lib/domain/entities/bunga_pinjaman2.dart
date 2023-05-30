import 'package:equatable/equatable.dart';

import 'kategori_pinjaman.dart';

class BungaPinjaman2 extends Equatable {
  final int id;
  final int kategoriPinjamanId;
  final int institutionId;
  final String tipeAngsuran;
  final String tipeBunga;
  final int? jangkaWaktu;
  final int? batasDurasiPinjamanBerjalan;
  final int pinalti;
  final double persentaseBunga;
  final int biayaAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final KategoriPinjaman kategoriPinjaman;

  BungaPinjaman2({
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

  @override
  // TODO: implement props
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
