import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/pinjaman.dart';

class ResponsePinjaman extends Equatable {
  const ResponsePinjaman({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final Pinjaman data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
