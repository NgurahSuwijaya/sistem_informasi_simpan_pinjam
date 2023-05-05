import 'package:equatable/equatable.dart';

import 'institution.dart';

class User extends Equatable {
  const User(
      {required this.id,
      required this.roleId,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.city,
      required this.province,
      required this.photoPath,
      required this.institutionId,
      // required this.emailVerifiedAt,
      // required this.createdAt,
      // required this.updatedAt,
      required this.institutions});

  final int id;
  final int roleId;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String city;
  final String province;
  final String? photoPath;
  final int institutionId;
  // final String emailVerifiedAt;
  // final String createdAt;
  // final String updatedAt;
  final Institution institutions;

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
