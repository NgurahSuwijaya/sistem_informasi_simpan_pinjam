// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:equatable/equatable.dart';

class Institution extends Equatable {
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
  String note;
  DateTime createdAt;
  DateTime updatedAt;

  Institution({
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
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

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
        // awalTahunBuku,
        status,
        // note,
        // createdAt,
        // updatedAt
      ];
}
