import 'package:equatable/equatable.dart';

class BungaPinjaman extends Equatable {
  final int id;
  final String? jangkaWaktu;
  final double? persentaseBunga;
  final int? jangkaWaktuInt;
  final int? batasDurasiPinjamanBerjalan;

  const BungaPinjaman(this.id, this.jangkaWaktu, this.persentaseBunga,
      this.jangkaWaktuInt, this.batasDurasiPinjamanBerjalan);

  @override
  List<Object?> get props => [id, jangkaWaktu, persentaseBunga, jangkaWaktu];
}
