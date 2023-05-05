import 'package:equatable/equatable.dart';

class Login extends Equatable {
  const Login({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
    // required this.institutionStatus,
  });

  final bool success;
  final String message;
  final String token;
  final LoginResponseData data;
  // final String institutionStatus;

  @override
  List<Object?> get props => [
        success,
        message,
        token,
        data,
        // institutionStatus,
      ];
}

class LoginResponseData extends Equatable {
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
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  // final int? admin;

  LoginResponseData({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.province,
    this.photoPath,
    required this.institutionId,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    // this.admin
  });

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
        emailVerifiedAt,
        createdAt,
        updatedAt,
        // admin
      ];
}
