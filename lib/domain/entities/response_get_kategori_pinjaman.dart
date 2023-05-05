import 'package:equatable/equatable.dart';

import 'kategori_pinjaman.dart';

class ResponseKategoriPinjaman extends Equatable {
  ResponseKategoriPinjaman({
    required this.success,
    required this.message,
    required this.data,
  });
  final bool success;
  final String message;
  final List<KategoriPinjaman> data;

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}
