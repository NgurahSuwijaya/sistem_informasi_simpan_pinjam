// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/entities/simpanan.dart';

class ResponseSimpanan extends Equatable {
  const ResponseSimpanan({
    required this.success,
    required this.message,
    required this.saldoGiro,
    required this.saldoBiasa,
    required this.saldoPokok,
    required this.saldoWajib,
    required this.saldoAwalGiro,
    required this.giroInstitusi,
    required this.maksPenarikan,
    required this.data,
  });

  final bool success;
  final String message;
  final int? saldoGiro;
  final int? saldoBiasa;
  final int? saldoPokok;
  final int? saldoWajib;
  final int? saldoAwalGiro;
  final int? maksPenarikan;
  final bool? giroInstitusi;
  final Simpanan data;

  @override
  List<Object?> get props {
    return [
      success,
      message,
      saldoGiro,
      saldoBiasa,
      saldoPokok,
      saldoWajib,
      saldoAwalGiro,
      maksPenarikan,
      giroInstitusi,
      data,
    ];
  }
}
