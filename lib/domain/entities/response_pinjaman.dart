import 'package:equatable/equatable.dart';

import 'pinjaman.dart';

class ResponsePinjaman extends Equatable {
  const ResponsePinjaman(
      {required this.success,
      required this.message,
      required this.data,
      required this.sisaPokok,
      required this.sisaBunga});

  final bool success;
  final String message;
  final Pinjaman data;
  final int? sisaPokok;
  final int? sisaBunga;

  @override
  List<Object?> get props => [success, message, data, sisaPokok, sisaBunga];
}
