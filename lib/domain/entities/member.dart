import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/user.dart';

class Member extends Equatable {
  Member(
      {required this.id,
      required this.institutionId,
      required this.createdAt,
      required this.updatedAt,
      required this.userId,
      required this.jenisKelamin,
      required this.tanggalLahir,
      required this.tempatLahir,
      required this.nomorIndukAnggota,
      required this.nomorKtp,
      required this.memberStatus,
      required this.user});

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
  User user;

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
