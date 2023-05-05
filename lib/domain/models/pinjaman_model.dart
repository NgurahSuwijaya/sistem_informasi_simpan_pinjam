import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/tipe_jaminan_model.dart';

import '../entities/pinjaman.dart';
import 'bunga_menetap_model.dart';
import 'bunga_menurun_model.dart';

class PinjamanModel extends Equatable {
  PinjamanModel({
    required this.id,
    required this.memberId,
    required this.adminId,
    this.bungaMenetapId,
    this.bungaMenurunId,
    required this.tipeBungaPinjaman,
    required this.jumlah,
    required this.tipeJaminanId,
    required this.nilaiAsetJaminan,
    required this.namaAsetJaminan,
    required this.dokumenAsetJaminan,
    required this.tanggalPinjaman,
    required this.statusPinjaman,
    required this.createdAt,
    required this.updatedAt,
    required this.tipeJaminan,
    this.bungaMenurun,
    this.bungaMenetap,
  });

  final int id;
  final int memberId;
  final int adminId;
  final int? bungaMenetapId;
  final int? bungaMenurunId;
  final String tipeBungaPinjaman;
  final int jumlah;
  final int tipeJaminanId;
  final int nilaiAsetJaminan;
  final String namaAsetJaminan;
  final String dokumenAsetJaminan;
  final DateTime tanggalPinjaman;
  final String statusPinjaman;
  final DateTime createdAt;
  final DateTime updatedAt;
  final TipeJaminanModel tipeJaminan;
  final BungaMenurunModel? bungaMenurun;
  final BungaMenetapModel? bungaMenetap;

  factory PinjamanModel.fromJson(Map<String, dynamic> json) => PinjamanModel(
        id: json["id"],
        memberId: json["member_id"],
        adminId: json["admin_id"],
        bungaMenetapId: json["bunga_menetap_id"],
        bungaMenurunId: json["bunga_menurun_id"],
        tipeBungaPinjaman: json["tipe_bunga_pinjaman"],
        jumlah: json["jumlah"],
        tipeJaminanId: json["tipe_jaminan_id"],
        nilaiAsetJaminan: json["nilai_aset_jaminan"],
        namaAsetJaminan: json["nama_aset_jaminan"],
        dokumenAsetJaminan: json["dokumen_aset_jaminan"],
        tanggalPinjaman: DateTime.parse(json["tanggal_pinjaman"]),
        statusPinjaman: json["status_pinjaman"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tipeJaminan: TipeJaminanModel.fromJson(json["tipe_jaminan"]),
        bungaMenurun: json["bunga_menurun"] == null
            ? null
            : BungaMenurunModel.fromJson(json["bunga_menurun"]),
        bungaMenetap: json["bunga_menetap"] == null
            ? null
            : BungaMenetapModel.fromJson(json["bunga_menetap"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_id": memberId,
        "admin_id": adminId,
        "bunga_menetap_id": bungaMenetapId,
        "bunga_menurun_id": bungaMenurunId,
        "tipe_bunga_pinjaman": tipeBungaPinjaman,
        "jumlah": jumlah,
        "tipe_jaminan_id": tipeJaminanId,
        "nilai_aset_jaminan": nilaiAsetJaminan,
        "nama_aset_jaminan": namaAsetJaminan,
        "dokumen_aset_jaminan": dokumenAsetJaminan,
        "tanggal_pinjaman": tanggalPinjaman.toIso8601String(),
        "status_pinjaman": statusPinjaman,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "tipe_jaminan": tipeJaminan.toJson(),
        "bunga_menurun": bungaMenurun?.toJson(),
        "bunga_menetap": bungaMenetap?.toJson(),
      };

  Pinjaman toEntity() {
    return Pinjaman(
        id: id,
        memberId: memberId,
        adminId: adminId,
        bungaMenetapId: bungaMenetapId,
        bungaMenurunId: bungaMenurunId,
        tipeBungaPinjaman: tipeBungaPinjaman,
        jumlah: jumlah,
        tipeJaminanId: tipeJaminanId,
        nilaiAsetJaminan: nilaiAsetJaminan,
        namaAsetJaminan: namaAsetJaminan,
        dokumenAsetJaminan: dokumenAsetJaminan,
        tanggalPinjaman: tanggalPinjaman,
        statusPinjaman: statusPinjaman,
        createdAt: createdAt,
        updatedAt: updatedAt,
        tipeJaminan: tipeJaminan.toEntity(),
        bungaMenurun: bungaMenurun?.toEntity(),
        bungaMenetap: bungaMenetap?.toEntity());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        memberId,
        adminId,
        bungaMenetapId,
        bungaMenurunId,
        tipeBungaPinjaman,
        jumlah,
        tipeJaminanId,
        nilaiAsetJaminan,
        namaAsetJaminan,
        dokumenAsetJaminan,
        tanggalPinjaman,
        statusPinjaman,
        createdAt,
        updatedAt,
        tipeJaminan,
        bungaMenurun,
        bungaMenetap
      ];
}
