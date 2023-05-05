import 'package:equatable/equatable.dart';
import '../entities/login.dart';

class LoginResponseModel extends Equatable {
  const LoginResponseModel({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
    // required this.institutionStatus,
  });

  final bool success;
  final String message;
  final String token;
  final LoginResponseDataModel data;
  // final String institutionStatus;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      token: json['token'],
      data: LoginResponseDataModel.fromJson(json['data']),
      // institutionStatus: json['institution_status'],
    );
  }

  Login toEntity() {
    return Login(
      success: success,
      message: message,
      token: token,
      data: data.toEntity(),
      // institutionStatus: institutionStatus
    );
  }

  @override
  List<Object?> get props => [
        success,
        message,
        token,
        data,
        // institutionStatus,
      ];
}

class LoginResponseDataModel extends Equatable {
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

  const LoginResponseDataModel({
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
    // required this.admin,
  });

  factory LoginResponseDataModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseDataModel(
      id: json['id'],
      roleId: json['role_id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      city: json['city'],
      province: json['province'],
      photoPath: json['photo_path'],
      institutionId: json['institution_id'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      // admin: json['admin'],
    );
  }

  LoginResponseData toEntity() {
    return LoginResponseData(
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
      emailVerifiedAt: emailVerifiedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      // admin: admin
    );
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
        emailVerifiedAt,
        createdAt,
        updatedAt,
        // admin
      ];
}
