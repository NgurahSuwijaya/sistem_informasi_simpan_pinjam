import 'package:equatable/equatable.dart';

class TipeTransaksis extends Equatable {
  final int id;
  final int institutionId;
  final String name;
  final int pengali;
  final int perhitunganBunga;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TipeTransaksis(
      {required this.id,
      required this.institutionId,
      required this.name,
      required this.pengali,
      required this.perhitunganBunga,
      required this.createdAt,
      required this.updatedAt});

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
