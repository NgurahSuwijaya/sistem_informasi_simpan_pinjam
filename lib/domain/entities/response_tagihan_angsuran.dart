import 'package:equatable/equatable.dart';

import 'tagihan_angsuran.dart';

class ResponseTagihanAngsuran extends Equatable {
  final bool success;
  final List<TagihanAngsuran>? tagihanAngsuran;
  final int? totalPokok;
  final int? totalBunga;
  final int? totalAdmin;
  final int? totalPenalti;
  final int? totalTagihan;

  const ResponseTagihanAngsuran(
      this.success,
      this.tagihanAngsuran,
      this.totalPokok,
      this.totalBunga,
      this.totalAdmin,
      this.totalPenalti,
      this.totalTagihan);

  @override
  List<Object?> get props => [
        success,
        tagihanAngsuran,
        totalPokok,
        totalBunga,
        totalAdmin,
        totalPenalti,
        totalTagihan
      ];
}
