import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_transaksi.dart';
import 'member.dart';

class Simpanan extends Equatable {
  final int id;
  final int institutionId;
  final int memberId;
  final int tipeSimpananId;
  final int? adminId;
  final int tipeTransaksiId;
  final String rekening;
  final String metodeSimpanan;
  final int jumlah;
  final int saldo;
  final DateTime tanggalTransaksi;
  final String? buktiPembayaran;
  final DateTime? verifiedAt;
  final String statusTransaksi;
  final String? kwitansi;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Member? member;
  final TipeTransaksis? tipeTransaksis;
  final TipeSimpanans? tipeSimpanans;

  const Simpanan({
    required this.id,
    required this.institutionId,
    required this.memberId,
    required this.tipeSimpananId,
    required this.adminId,
    required this.tipeTransaksiId,
    required this.rekening,
    required this.metodeSimpanan,
    required this.jumlah,
    required this.saldo,
    required this.tanggalTransaksi,
    required this.buktiPembayaran,
    required this.verifiedAt,
    required this.statusTransaksi,
    required this.kwitansi,
    required this.createdAt,
    required this.updatedAt,
    required this.member,
    required this.tipeTransaksis,
    required this.tipeSimpanans,
  });

  @override
  List<Object?> get props => [
        id,
        institutionId,
        memberId,
        tipeSimpananId,
        adminId,
        tipeTransaksiId,
        rekening,
        metodeSimpanan,
        jumlah,
        saldo,
        tanggalTransaksi,
        buktiPembayaran,
        verifiedAt,
        statusTransaksi,
        kwitansi,
        createdAt,
        updatedAt,
        member,
        tipeTransaksis,
        tipeSimpanans,
      ];
}
