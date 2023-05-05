// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_transaksi.dart';
import 'member.dart';

class Simpanan extends Equatable {
  int id;
  int institutionId;
  int memberId;
  int tipeSimpananId;
  int adminId;
  int tipeTransaksiId;
  String metodeSimpanan;
  int jumlah;
  int saldo;
  DateTime tanggalTransaksi;
  String buktiPembayaran;
  DateTime verifiedAt;
  String statusTransaksi;
  DateTime createdAt;
  DateTime updatedAt;
  Member member;
  TipeTransaksis tipeTransaksis;
  TipeSimpanans tipeSimpanans;

  Simpanan({
    required this.id,
    required this.institutionId,
    required this.memberId,
    required this.tipeSimpananId,
    required this.adminId,
    required this.tipeTransaksiId,
    required this.metodeSimpanan,
    required this.jumlah,
    required this.saldo,
    required this.tanggalTransaksi,
    required this.buktiPembayaran,
    required this.verifiedAt,
    required this.statusTransaksi,
    required this.createdAt,
    required this.updatedAt,
    required this.member,
    required this.tipeTransaksis,
    required this.tipeSimpanans,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        institutionId,
        memberId,
        tipeSimpananId,
        adminId,
        tipeTransaksiId,
        metodeSimpanan,
        jumlah,
        saldo,
        tanggalTransaksi,
        buktiPembayaran,
        verifiedAt,
        statusTransaksi,
        createdAt,
        updatedAt,
        member,
        tipeTransaksis,
        tipeSimpanans,
      ];
}
