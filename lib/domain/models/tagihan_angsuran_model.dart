import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tagihan_angsuran.dart';

import 'pinjaman_model.dart';

class TagihanAngsuranModel extends Equatable {
  final int id;
  final int pinjamanId;
  final int memberId;
  final int tagihanPokok;
  final int tagihanBunga;
  final int tagihanPenalti;
  final int tagihanAdmin;
  final String status;
  final int angsuranKe;
  final DateTime jatuhTempo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PinjamanModel pinjaman;

  TagihanAngsuranModel(
      {required this.id,
      required this.pinjamanId,
      required this.memberId,
      required this.tagihanPokok,
      required this.tagihanBunga,
      required this.tagihanPenalti,
      required this.tagihanAdmin,
      required this.status,
      required this.angsuranKe,
      required this.jatuhTempo,
      required this.createdAt,
      required this.updatedAt,
      required this.pinjaman});

  factory TagihanAngsuranModel.fromJson(Map<String, dynamic> json) =>
      TagihanAngsuranModel(
        id: json["id"],
        pinjamanId: json["pinjaman_id"],
        memberId: json["member_id"],
        tagihanPokok: json["tagihan_pokok"],
        tagihanBunga: json["tagihan_bunga"],
        tagihanPenalti: json["tagihan_penalti"],
        tagihanAdmin: json["tagihan_admin"],
        status: json["status"],
        angsuranKe: json["angsuran_ke"],
        jatuhTempo: DateTime.parse(json["jatuh_tempo"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pinjaman: PinjamanModel.fromJson(json["pinjaman"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pinjaman_id": pinjamanId,
        "member_id": memberId,
        "tagihan_pokok": tagihanPokok,
        "tagihan_bunga": tagihanBunga,
        "tagihan_penalti": tagihanPenalti,
        "tagihan_admin": tagihanAdmin,
        "status": status,
        "angsuran_ke": angsuranKe,
        "jatuh_tempo": jatuhTempo.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pinjaman": pinjaman.toJson(),
      };

  TagihanAngsuran toEntity() {
    return TagihanAngsuran(
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
        pinjaman.toEntity());
  }

  @override
  // TODO: implement props
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
