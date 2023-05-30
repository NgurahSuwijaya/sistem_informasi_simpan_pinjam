import 'package:equatable/equatable.dart';

class AngsuranModel extends Equatable {
  final int angsuranKe;
  final int sisaPokok;
  final double pokokBulanIni;
  final int bungaBulanIni;
  final int administrasiBulanIni;
  final int pinaltiBulanIni;

  AngsuranModel({
    required this.angsuranKe,
    required this.sisaPokok,
    required this.pokokBulanIni,
    required this.bungaBulanIni,
    required this.administrasiBulanIni,
    required this.pinaltiBulanIni,
  });

  factory AngsuranModel.fromJson(Map<String, dynamic> json) => AngsuranModel(
        angsuranKe: json["angsuran_ke"],
        sisaPokok: json["sisa_pokok"],
        pokokBulanIni: json["pokok_bulan_ini"]?.toDouble(),
        bungaBulanIni: json["bunga_bulan_ini"],
        administrasiBulanIni: json["administrasi_bulan_ini"],
        pinaltiBulanIni: json["pinalti_bulan_ini"],
      );

  Map<String, dynamic> toJson() => {
        "angsuran_ke": angsuranKe,
        "sisa_pokok": sisaPokok,
        "pokok_bulan_ini": pokokBulanIni,
        "bunga_bulan_ini": bungaBulanIni,
        "administrasi_bulan_ini": administrasiBulanIni,
        "pinalti_bulan_ini": pinaltiBulanIni,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        angsuranKe,
        sisaPokok,
        pokokBulanIni,
        bungaBulanIni,
        administrasiBulanIni,
        pinaltiBulanIni
      ];
}
