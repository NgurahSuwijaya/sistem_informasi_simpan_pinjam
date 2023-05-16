import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/institution.dart';

class InstitutionsModel extends Equatable {
  InstitutionsModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.province,
    required this.phoneNumber,
    required this.email,
    required this.photoPath,
    required this.persentaseBungaSimpanan,
    required this.persentasePajakBungaSimpanan,
    required this.awalTahunBuku,
    required this.status,
    // required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String address;
  String city;
  String province;
  String phoneNumber;
  String email;
  String photoPath;
  double persentaseBungaSimpanan;
  int persentasePajakBungaSimpanan;
  int awalTahunBuku;
  String status;
  // String note;
  DateTime createdAt;
  DateTime updatedAt;

  factory InstitutionsModel.fromJson(Map<String, dynamic> json) =>
      InstitutionsModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        photoPath: json["photo_path"],
        persentaseBungaSimpanan: json["persentase_bunga_simpanan"]?.toDouble(),
        persentasePajakBungaSimpanan: json["persentase_pajak_bunga_simpanan"],
        awalTahunBuku: json["awal_tahun_buku"],
        status: json["status"],
        // note: json["note"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "province": province,
        "phone_number": phoneNumber,
        "email": email,
        "photo_path": photoPath,
        "persentase_bunga_simpanan": persentaseBungaSimpanan,
        "persentase_pajak_bunga_simpanan": persentasePajakBungaSimpanan,
        "awal_tahun_buku": awalTahunBuku,
        "status": status,
        // "note": note,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  Institution toEntity() {
    return Institution(
        id: id,
        name: name,
        address: address,
        city: city,
        province: province,
        phoneNumber: phoneNumber,
        email: email,
        photoPath: photoPath,
        persentaseBungaSimpanan: persentaseBungaSimpanan,
        persentasePajakBungaSimpanan: persentasePajakBungaSimpanan,
        awalTahunBuku: awalTahunBuku,
        status: status,
        // note: note,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        address,
        city,
        province,
        phoneNumber,
        email,
        photoPath,
        persentaseBungaSimpanan,
        persentasePajakBungaSimpanan,
        awalTahunBuku,
        status,
        // note,
        createdAt,
        updatedAt
      ];
}
