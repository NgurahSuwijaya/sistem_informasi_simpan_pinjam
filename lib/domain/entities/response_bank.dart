import 'package:equatable/equatable.dart';

class ResponseBank extends Equatable {
  final bool success;
  final String message;
  final List<Bank> data;

  const ResponseBank(this.success, this.message, this.data);

  @override
  List<Object?> get props => [success, message, data];
}

class Bank extends Equatable {
  final int id;
  final int institutionId;
  final String namaBank;
  final String nomorRekening;
  final String atasNama;

  const Bank({
    required this.id,
    required this.institutionId,
    required this.namaBank,
    required this.nomorRekening,
    required this.atasNama,
  });

  @override
  List<Object?> get props => [
        id,
        institutionId,
        namaBank,
        nomorRekening,
        atasNama,
      ];
}
