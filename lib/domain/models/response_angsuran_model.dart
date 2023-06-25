// import 'package:equatable/equatable.dart';
// import 'package:sistem_informasi_simpan_pinjam/domain/models/angsuran_model.dart';

// import 'angsuran_pinjaman_detail.dart';

// class ResponseAngsuranModel extends Equatable {
//   final bool success;
//   final String message;
//   final AngsuranPinjamanTerakhirModel angsuranPinjamanTerakhir;
//   final int selanjutnyaAngsuranKe;
//   final AngsuranModel angsuran;

//   ResponseAngsuranModel({
//     required this.success,
//     required this.message,
//     required this.angsuranPinjamanTerakhir,
//     required this.selanjutnyaAngsuranKe,
//     required this.angsuran,
//   });

//   factory ResponseAngsuranModel.fromJson(Map<String, dynamic> json) =>
//       ResponseAngsuranModel(
//         success: json["success"],
//         message: json["message"],
//         angsuranPinjamanTerakhir: AngsuranPinjamanTerakhirModel.fromJson(
//             json["angsuranPinjamanTerakhir"]),
//         selanjutnyaAngsuranKe: json["selanjutnyaAngsuranKe"],
//         angsuran: AngsuranModel.fromJson(json["data"]),
//       );

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         success,
//         message,
//         angsuranPinjamanTerakhir,
//         selanjutnyaAngsuranKe,
//         angsuran
//       ];
// }
