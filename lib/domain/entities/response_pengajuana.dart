import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_jaminan.dart';

import 'bunga_pinjaman.dart';

class ResponsePengajuan extends Equatable {
  final bool success;
  final String message;
  final List<BungaPinjaman> bungaPinjaman;
  final List<TipeJaminan> tipeJaminan;

  const ResponsePengajuan(
      this.success, this.message, this.bungaPinjaman, this.tipeJaminan);

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, bungaPinjaman, tipeJaminan];
}
