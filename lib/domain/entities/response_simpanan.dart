import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/simpanan.dart';

class ResponseSimpanan extends Equatable {
  const ResponseSimpanan({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final Simpanan data;

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
