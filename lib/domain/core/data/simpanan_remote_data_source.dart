import 'dart:convert';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import 'package:http/http.dart' as http;

import '../../models/response_post_model.dart';
import '../../models/response_simpanan_model.dart';
import '../../models/response_tipe_simpanan_model.dart';
import '../error/exception.dart';

abstract class SimpananDataSource {
  Future<ResponseSimpananModel> onGetSimpananData(String? token);
  Future<ResponseTipeSimpananModel> onGetTipeSimpananData(String? token);
  Future<ResponsePostModel> onPostSimpananData(
      String? token,
      int tipeSimpananId,
      int tipeTransaksiId,
      int jumlah,
      String tipeSimpanan,
      DateTime tanggalTransaksi,
      String rekening,
      File? buktiBayar,
      String? nomorIndukPenerima,
      String? passAkun);
  Future<ResponseSimpananModel> onGetDetailSimpananData(
      String? token, int idSimpanan);
  Future<ResponsePostModel> onIjinkanPenarikan(String? token, int id);
  Future<ResponsePostModel> onTolakPenarikan(String? token, int id);

  // Future<ResponsePostModel> onPostPenarikanData(
  //   String? token,
  //   int tipeSimpananId,
  //   int tipeTransaksiId,
  //   int jumlah,
  //   String tipeSimpanan,
  //   DateTime tanggalTransaksi,
  //   String rekening,
  // );
}

class SimpananDataSourceImpl implements SimpananDataSource {
  // static const baseUrl = "http://localhost:8000/api";
  static const baseUrl = "http://10.0.2.2:8000/api";
  final http.Client _httpClient;

  SimpananDataSourceImpl(this._httpClient);

  @override
  Future<ResponseSimpananModel> onGetSimpananData(String? token) async {
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/simpanan/index-member-data?'), headers: {
      'Authorization': 'Bearer ${token ?? " "}',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponseSimpananModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<ResponseTipeSimpananModel> onGetTipeSimpananData(String? token) async {
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/tipe-simpanan/indexMember?'), headers: {
      'Authorization': 'Bearer ${token ?? " "}',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponseTipeSimpananModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<ResponsePostModel> onPostSimpananData(
      String? tokenn,
      int tipeSimpananId,
      int tipeTransaksiId,
      int jumlah,
      String tipeSimpanan,
      DateTime tanggalTransaksi,
      String rekening,
      File? buktiBayar,
      String? nomorIndukPenerima,
      String? passAkun) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/simpanan/store-online?'));

    request.headers['Authorization'] = 'Bearer ${tokenn ?? ""}';
    request.headers['Accept'] = 'application/json';
    print(tokenn);
    print(tipeSimpanan);
    if (buktiBayar != null && tipeTransaksiId == 1) {
      String fileName = basename(buktiBayar.path);
      request.files.add(await http.MultipartFile.fromPath(
        'bukti_pembayaran',
        buktiBayar.path,
        filename: fileName,
      ));
    }
    request.fields['tipe_transaksi_id'] = tipeTransaksiId.toString();
    request.fields['jumlah'] = jumlah.toString();
    request.fields['tanggal_transaksi'] = tanggalTransaksi.toString();
    request.fields['tipe_simpanan_id'] = tipeSimpananId.toString();
    request.fields['rekening'] = rekening;
    request.fields['tipe_simpanan'] = tipeSimpanan;

    if (nomorIndukPenerima != null && passAkun != null) {
      request.fields['no_induk_tujuan'] = nomorIndukPenerima;
      request.fields['password'] = passAkun;
    }

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    print(response.statusCode);
    print(responseBody);
    if (response.statusCode == 200) {
      return ResponsePostModel.fromJson(json.decode(responseBody));
    } else {
      throw ServerException(message: responseBody);
    }
  }

  @override
  Future<ResponseSimpananModel> onGetDetailSimpananData(
      String? token, int idSimpanan) async {
    final id = idSimpanan;
    final response = await _httpClient
        .post(Uri.parse('$baseUrl/simpanan/get-detail-member/$id'), headers: {
      'Authorization': 'Bearer ${token ?? " "}',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponseSimpananModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<ResponsePostModel> onIjinkanPenarikan(String? token, int id) async {
    final response = await _httpClient.post(
        Uri.parse('$baseUrl/simpanan/store-kontrol-penarikan-acc/$id'),
        headers: {
          'Authorization': 'Bearer ${token ?? " "}',
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponsePostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<ResponsePostModel> onTolakPenarikan(String? token, int id) async {
    final response = await _httpClient.post(
        Uri.parse('$baseUrl/simpanan/store-kontrol-penarikan-reject/$id'),
        headers: {
          'Authorization': 'Bearer ${token ?? " "}',
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponsePostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }
}
