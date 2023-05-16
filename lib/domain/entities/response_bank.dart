import 'package:equatable/equatable.dart';

class ResponseBank extends Equatable {
  final bool success;
  final String message;
  final List<Bank> data;

  ResponseBank(this.success, this.message, this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}

class Bank extends Equatable {
  final int id;
  final int institutionId;
  final String namaBank;
  final String nomorRekening;
  final String atasNama;
  final DateTime createdAt;
  final DateTime updatedAt;

  Bank({
    required this.id,
    required this.institutionId,
    required this.namaBank,
    required this.nomorRekening,
    required this.atasNama,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        institutionId,
        namaBank,
        nomorRekening,
        atasNama,
        createdAt,
        updatedAt
      ];
}
