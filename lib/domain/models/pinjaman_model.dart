// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:sistem_informasi_simpan_pinjam/domain/models/kategori_pinjaman_model.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/tipe_jaminan_model.dart';

import '../entities/pinjaman.dart';
import 'bunga_pinjaman2_model.dart';

class PinjamanModel extends Equatable {
  PinjamanModel({
    required this.id,
    required this.memberId,
    required this.adminId,
    required this.kategoriPinjamanId,
    required this.bungaPinjamanId,
    required this.tipeAngsuran,
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
    required this.bungaPinjaman,
  });
  final int id;
  final int memberId;
  final int adminId;
  final int kategoriPinjamanId;
  final int bungaPinjamanId;
  final String tipeAngsuran;
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
  final TipeJaminanModel? tipeJaminan;
  final BungaPinjaman2Model? bungaPinjaman;

  factory PinjamanModel.fromJson(Map<String, dynamic> json) => PinjamanModel(
        id: json["id"],
        memberId: json["member_id"],
        adminId: json["admin_id"],
        kategoriPinjamanId: json["kategori_pinjaman_id"],
        bungaPinjamanId: json["bunga_pinjaman_id"],
        tipeAngsuran: json["tipe_angsuran"],
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
        tipeJaminan: json["tipe_jaminan"] == null
            ? null
            : TipeJaminanModel.fromJson(json["tipe_jaminan"]),
        bungaPinjaman: json["bunga_pinjaman"] == null
            ? null
            : BungaPinjaman2Model.fromJson(json["bunga_pinjaman"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "member_id": memberId,
        "admin_id": adminId,
        "kategori_pinjaman_id": kategoriPinjamanId,
        "bunga_pinjaman_id": bungaPinjamanId,
        "tipe_angsuran": tipeAngsuran,
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
        "tipe_jaminan": tipeJaminan?.toJson(),
        "bunga_pinjaman": bungaPinjaman?.toJson(),
      };

  Pinjaman toEntity() {
    return Pinjaman(
      id: id,
      memberId: memberId,
      adminId: adminId,
      kategoriPinjamanId: kategoriPinjamanId,
      bungaPinjamanId: bungaPinjamanId,
      tipeAngsuran: tipeAngsuran,
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
      tipeJaminan: tipeJaminan?.toEntity(),
      bungaPinjaman: bungaPinjaman?.toEntity(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        memberId,
        adminId,
        kategoriPinjamanId,
        bungaPinjamanId,
        tipeAngsuran,
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
        bungaPinjaman,
      ];
}
