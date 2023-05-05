import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/kategori_pinjaman.dart';

class KategoriPinjamanModel extends Equatable {
  KategoriPinjamanModel({
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

  factory KategoriPinjamanModel.fromJson(Map<String, dynamic> json) =>
      KategoriPinjamanModel(
        id: json["id"],
        institutionId: json["institution_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  KategoriPinjaman toEntity() {
    return KategoriPinjaman(
        id: id,
        institutionId: institutionId,
        name: name,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

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
