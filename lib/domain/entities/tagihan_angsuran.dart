import 'package:equatable/equatable.dart';

import 'pinjaman.dart';

class TagihanAngsuran extends Equatable {
  final int id;
  final int pinjamanId;
  final int memberId;
  final int? tagihanPokok;
  final int? tagihanBunga;
  final int? tagihanPenalti;
  final int? tagihanAdmin;
  final String? status;
  final int? angsuranKe;
  final DateTime? jatuhTempo;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pinjaman? pinjaman;

  const TagihanAngsuran(
      this.id,
      this.pinjamanId,
      this.memberId,
      this.tagihanPokok,
      this.tagihanBunga,
      this.tagihanPenalti,
      this.tagihanAdmin,
      this.status,
      this.angsuranKe,
      this.jatuhTempo,
      this.createdAt,
      this.updatedAt,
      this.pinjaman);

  @override
  List<Object?> get props => [
        id,
        pinjamanId,
        memberId,
        tagihanPokok,
        tagihanBunga,
        tagihanPenalti,
        tagihanAdmin,
        status,
        angsuranKe,
        jatuhTempo,
        createdAt,
        updatedAt,
        pinjaman
      ];
}
