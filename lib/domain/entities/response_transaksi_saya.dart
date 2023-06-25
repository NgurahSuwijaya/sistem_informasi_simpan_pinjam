import 'package:equatable/equatable.dart';

class ResponseTransaksiSaya extends Equatable {
  final bool? success;
  final String? message;
  final Data? data;

  const ResponseTransaksiSaya(this.success, this.message, this.data);

  @override
  List<Object?> get props => [success, message, data];
}

class Data extends Equatable {
  final int? currentPage;
  final List<TransaksiSaya>? data;
  final String? nextPageUrl;
  final int? to;
  final int? total;

  const Data(
      this.currentPage, this.data, this.nextPageUrl, this.to, this.total);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TransaksiSaya extends Equatable {
  final int? id;
  final int? memberId;
  final int? simpananId;
  final int? pinjamanId;
  final dynamic angsuranId;
  final String? rekening;
  final String? tipeSimpanan;
  final DateTime? tanggalTransaksi;
  final dynamic angsuranKe;
  final int? pembayaranPokok;
  final int? pembayaranBunga;
  final int? pembayaranAdministrasi;
  final int? pembayaranPenalti;
  final String? tipeAngsuran;
  final String? tipeBungaPinjaman;
  final int? nilaiAsetJaminan;
  final String? namaAsetJaminan;
  final String? dokumenAsetJaminan;
  final String? buktiPembayaran;
  final dynamic metodeAngsuran;
  final int? jumlah;
  final String? statusTransaksi;
  final String? kwitansi;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? tipeTransaksiId;

  const TransaksiSaya(
      this.id,
      this.memberId,
      this.simpananId,
      this.pinjamanId,
      this.angsuranId,
      this.rekening,
      this.tipeSimpanan,
      this.tanggalTransaksi,
      this.angsuranKe,
      this.pembayaranPokok,
      this.pembayaranBunga,
      this.pembayaranAdministrasi,
      this.pembayaranPenalti,
      this.tipeAngsuran,
      this.tipeBungaPinjaman,
      this.nilaiAsetJaminan,
      this.namaAsetJaminan,
      this.dokumenAsetJaminan,
      this.buktiPembayaran,
      this.metodeAngsuran,
      this.jumlah,
      this.statusTransaksi,
      this.kwitansi,
      this.createdAt,
      this.updatedAt,
      this.tipeTransaksiId);

  @override
  List<Object?> get props => [
        id,
        memberId,
        simpananId,
        pinjamanId,
        angsuranId,
        rekening,
        tipeSimpanan,
        tanggalTransaksi,
        angsuranKe,
        pembayaranPokok,
        pembayaranBunga,
        pembayaranAdministrasi,
        pembayaranPenalti,
        tipeAngsuran,
        tipeBungaPinjaman,
        nilaiAsetJaminan,
        namaAsetJaminan,
        dokumenAsetJaminan,
        buktiPembayaran,
        metodeAngsuran,
        jumlah,
        statusTransaksi,
        kwitansi,
        createdAt,
        updatedAt,
        tipeTransaksiId
      ];
}
