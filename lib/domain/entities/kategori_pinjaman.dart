import 'package:equatable/equatable.dart';

class KategoriPinjaman extends Equatable {
  KategoriPinjaman({
    required this.id,
    required this.institutionId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int institutionId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        institutionId,
        name,
        createdAt,
        updatedAt,
      ];
}
