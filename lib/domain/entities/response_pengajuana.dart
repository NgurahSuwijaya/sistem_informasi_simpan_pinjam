import 'package:equatable/equatable.dart';
import 'bunga_pinjaman.dart';
import 'tipe_jaminan.dart';

class ResponsePengajuan extends Equatable {
  final bool success;
  final String message;
  final List<BungaPinjaman> bungaPinjaman;
  final List<TipeJaminan> tipeJaminan;

  const ResponsePengajuan(
      this.success, this.message, this.bungaPinjaman, this.tipeJaminan);

  @override
  List<Object?> get props => [success, message, bungaPinjaman, tipeJaminan];
}
