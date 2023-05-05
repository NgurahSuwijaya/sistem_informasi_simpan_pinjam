import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../entities/response_pinjaman.dart';
import '../data/pinjaman_remote_data_source.dart';
import '../error/exception.dart';
import '../error/failure.dart';
import '../repositories/pinjaman_repository.dart';

class PinjamanRepositoryImpl implements PinjamanRepository {
  final PinjamanDataSource pinjamanDataSource;

  PinjamanRepositoryImpl({
    required this.pinjamanDataSource,
  });

  @override
  Future<Either<Failure, ResponsePinjaman>> getPinjamanData({token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final result = await pinjamanDataSource.onGetPinjamanData(token);
      // print(result);
      return Right(result.toEntity());
    } on ServerException {
      prefs.setBool('punyaPinjaman', false);
      return Left(ServerFailure('Saat ini anda tidak dalam pinjaman'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
