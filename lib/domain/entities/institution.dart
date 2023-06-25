// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Institution extends Equatable {
  final int id;
  final String name;
  final String address;
  final String city;
  final String province;
  final String phoneNumber;
  final String email;
  final String photoPath;
  final double persentaseBungaSimpanan;
  final int persentasePajakBungaSimpanan;
  final int awalTahunBuku;
  final String status;
  // String note;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Institution({
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

  @override
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
