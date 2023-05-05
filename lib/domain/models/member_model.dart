// To parse this JSON data, do
//
//     final member = memberFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/member.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/user_model.dart';

class MemberModel extends Equatable {
  MemberModel({
    required this.id,
    required this.userId,
    required this.institutionId,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.tempatLahir,
    required this.nomorIndukAnggota,
    required this.nomorKtp,
    required this.memberStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  int userId;
  int institutionId;
  String jenisKelamin;
  DateTime tanggalLahir;
  String tempatLahir;
  String nomorIndukAnggota;
  String nomorKtp;
  String memberStatus;
  DateTime createdAt;
  DateTime updatedAt;
  UserModel user;

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        id: json["id"],
        userId: json["user_id"],
        institutionId: json["institution_id"],
        jenisKelamin: json["jenis_kelamin"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        tempatLahir: json["tempat_lahir"],
        nomorIndukAnggota: json["nomor_induk_anggota"],
        nomorKtp: json["nomor_ktp"],
        memberStatus: json["member_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "institution_id": institutionId,
        "jenis_kelamin": jenisKelamin,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "tempat_lahir": tempatLahir,
        "nomor_induk_anggota": nomorIndukAnggota,
        "nomor_ktp": nomorKtp,
        "member_status": memberStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };

  Member toEntity() {
    return Member(
        id: id,
        institutionId: institutionId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        userId: userId,
        jenisKelamin: jenisKelamin,
        tanggalLahir: tanggalLahir,
        tempatLahir: tempatLahir,
        nomorIndukAnggota: nomorIndukAnggota,
        nomorKtp: nomorKtp,
        memberStatus: memberStatus,
        user: user.toEntity());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        institutionId,
        createdAt,
        updatedAt,
        userId,
        jenisKelamin,
        tanggalLahir,
        tempatLahir,
        nomorIndukAnggota,
        nomorKtp,
        memberStatus,
        user
      ];
}
