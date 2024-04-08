import 'package:equatable/equatable.dart';
import '../entities/user.dart';
import 'institution_model.dart';

class UserModel extends Equatable {
  const UserModel({
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

  final int id;
  final int roleId;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String province;
  final String photoPath;
  final int institutionId;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final InstitutionsModel institutions;

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
