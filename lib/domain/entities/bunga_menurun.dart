import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/kategori_pinjaman.dart';

class BungaMenurun extends Equatable {
  BungaMenurun({
    required this.id,
    required this.institutionId,
    required this.createdAt,
    required this.updatedAt,
    required this.kategoriPinjamanId,
    required this.batasDurasiPinjamanBerjalan,
    required this.persentaseBunga,
    required this.biayaAdmin,
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
  final KategoriPinjaman kategoriPinjaman;

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
