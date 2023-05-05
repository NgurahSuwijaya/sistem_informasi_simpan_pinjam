import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/user.dart';

import 'institution_model.dart';

class UserModel extends Equatable {
  UserModel({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.province,
    required this.photoPath,
    required this.institutionId,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.institutions,
  });

  int id;
  int roleId;
  String name;
  String email;
  String phoneNumber;
  String address;
  String city;
  String province;
  String photoPath;
  int institutionId;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  InstitutionsModel institutions;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        city: json["city"],
        province: json["province"],
        photoPath: json["photo_path"],
        institutionId: json["institution_id"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        institutions: InstitutionsModel.fromJson(json["institutions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "address": address,
        "city": city,
        "province": province,
        "photo_path": photoPath,
        "institution_id": institutionId,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "institutions": institutions.toJson(),
      };

  User toEntity() {
    return User(
        id: id,
        roleId: roleId,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
        city: city,
        province: province,
        photoPath: photoPath,
        institutionId: institutionId,
        // emailVerifiedAt: emailVerifiedAt,
        // createdAt: createdAt,
        // updatedAt: updatedAt,
        institutions: institutions.toEntity());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        roleId,
        name,
        email,
        phoneNumber,
        address,
        city,
        province,
        photoPath,
        institutionId,
        // emailVerifiedAt,
        // createdAt,
        // updatedAt,
        institutions
      ];
}
