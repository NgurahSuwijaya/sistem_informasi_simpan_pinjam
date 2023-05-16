import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_simpanan.dart';

class ResponseTipeSimpanan extends Equatable {
  final bool success;
  final String message;
  final List<TipeSimpanans> data;

  ResponseTipeSimpanan(this.success, this.message, this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}
