import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../entities/angsuran_pinjaman_detail.dart';
import '../../entities/response_post.dart';
import '../../entities/response_tagihan_angsuran.dart';
import '../error/failure.dart';

abstract class AngsuranRepository {
  Future<Either<Failure, ResponsePost>> onPostBayarAngsuran(
      {required String? token,
      required ResponseTagihanAngsuran responseTagihanAngsuran,
      required int jumlah,
      required File? buktiBayar});

  Future<Either<Failure, AngsuranDetail>> onGetDetailAngsuran(
      {required String? token, required int id});
}
