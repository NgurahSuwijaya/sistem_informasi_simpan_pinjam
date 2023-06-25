import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/user.dart';

class Member extends Equatable {
  const Member(
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
      required this.kontrolPenarikan,
      required this.rekeningGiro,
      required this.user});

  final int id;
  final int userId;
  final int institutionId;
  final String jenisKelamin;
  final DateTime tanggalLahir;
  final String tempatLahir;
  final String nomorIndukAnggota;
  final String nomorKtp;
  final String memberStatus;
  final String? kontrolPenarikan;
  final bool rekeningGiro;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  @override
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
        kontrolPenarikan,
        rekeningGiro,
        user
      ];
}
