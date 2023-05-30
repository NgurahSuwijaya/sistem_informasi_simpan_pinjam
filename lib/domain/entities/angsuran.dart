import 'package:equatable/equatable.dart';

class Angsuran extends Equatable {
  final int angsuranKe;
  final int sisaPokok;
  final double pokokBulanIni;
  final int bungaBulanIni;
  final int administrasiBulanIni;
  final int pinaltiBulanIni;

  Angsuran(this.angsuranKe, this.sisaPokok, this.pokokBulanIni,
      this.bungaBulanIni, this.administrasiBulanIni, this.pinaltiBulanIni);

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
