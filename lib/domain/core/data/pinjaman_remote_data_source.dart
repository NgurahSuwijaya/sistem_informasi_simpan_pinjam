import 'dart:convert';
import 'dart:io';

import 'package:sistem_informasi_simpan_pinjam/domain/models/response_get_kategori_pinjaman_model.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/response_pengajuan_model.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/response_pinjaman_model.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_informasi_simpan_pinjam/domain/models/response_post_model.dart';
import "package:path/path.dart";

import '../error/exception.dart';

abstract class PinjamanDataSource {
  Future<ResponsePinjamanModel> onGetPinjamanData(String? token);
  Future<ResponseKategoriPinjamanModel> onGetKategoriPinjamanData(
      String? token);
  Future<ResponsePengajuanModel> onGetPengajuanData(String? token,
      String tipeBunga, String tipeAngsuran, int kategoriPinjamanId);
  Future<ResponsePostModel> onPostPengajuanData(
      String? token,
      String kategoriPinjamanId,
      String bungaPinjamanId,
      String tipeBungaPinjaman,
      int jumlah,
      String tipeJaminanId,
      int nilaiAsetJaminan,
      String namaAsetJaminan,
      File? dokumenAsetJaminan,
      String tipeAngsuran);
  Future<ResponsePinjamanModel> onGetPinjamanDetail(String? token, int id);
}

class PinjamanDataSourceImpl implements PinjamanDataSource {
  // static const baseUrl = "http://localhost:8000/api";
  static const baseUrl = "http://10.0.2.2:8000/api";
  final http.Client _httpClient;

  PinjamanDataSourceImpl(this._httpClient);

  @override
  Future<ResponsePinjamanModel> onGetPinjamanData(String? token) async {
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/pinjaman/index-member?'), headers: {
      'Authorization': 'Bearer ${token ?? " "}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    // print(response.statusCode);
    // print(response.body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam = ResponsePinjamanModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponsePinjamanModel.fromJson(json.decode(response.body));
      // } else if(response.statusCode == 401){
      //   return
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponseKategoriPinjamanModel> onGetKategoriPinjamanData(
      String? token) async {
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/kategori-pinjaman/indexMember?'), headers: {
      'Authorization': 'Bearer ${token ?? " "}',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var ayam =
          ResponseKategoriPinjamanModel.fromJson(json.decode(response.body));
      print(ayam.data);
      return ResponseKategoriPinjamanModel.fromJson(json.decode(response.body));
      // } else if(response.statusCode == 401){
      //   return
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponsePengajuanModel> onGetPengajuanData(String? token,
      String tipeBunga, String tipeAngsuran, int kategoriPinjamanId) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/pinjaman/create-member?'));

    request.headers['Authorization'] = 'Bearer ${token ?? ""}';
    request.headers['Accept'] = 'application/json';
    print(token);

    request.fields['tipe_bunga'] = tipeBunga.toString();
    request.fields['tipe_angsuran'] = tipeAngsuran.toString();
    request.fields['kategori_pinjaman_id'] = kategoriPinjamanId.toString();

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    print(response.statusCode);
    print(responseBody);
    if (response.statusCode == 200) {
      return ResponsePengajuanModel.fromJson(json.decode(responseBody));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponsePostModel> onPostPengajuanData(
      String? token,
      String kategoriPinjamanId,
      String bungaPinjamanId,
      String tipeBungaPinjaman,
      int jumlah,
      String tipeJaminanId,
      int nilaiAsetJaminan,
      String namaAsetJaminan,
      File? dokumenAsetJaminan,
      String tipeAngsuran) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/pinjaman/store-member?'));

    request.headers['Authorization'] = 'Bearer ${token ?? ""}';
    request.headers['Accept'] = 'application/json';
    print(token);
    if (dokumenAsetJaminan != null) {
      String fileName = basename(dokumenAsetJaminan.path);
      request.files.add(await http.MultipartFile.fromPath(
        'dokumen_aset_jaminan',
        dokumenAsetJaminan.path,
        filename: fileName,
      ));
    }
    request.fields['kategori_pinjaman_id'] = kategoriPinjamanId;
    request.fields['bunga_pinjaman_id'] = bungaPinjamanId;
    request.fields['tipe_bunga_pinjaman'] = tipeBungaPinjaman;
    request.fields['jumlah'] = jumlah.toString();
    request.fields['tipe_jaminan_id'] = tipeJaminanId;
    request.fields['nilai_aset_jaminan'] = nilaiAsetJaminan.toString();
    request.fields['nama_aset_jaminan'] = namaAsetJaminan;
    request.fields['tipe_angsuran'] = tipeAngsuran;

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    print(response.statusCode);
    print(responseBody);
    if (response.statusCode == 200) {
      return ResponsePostModel.fromJson(json.decode(responseBody));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponsePinjamanModel> onGetPinjamanDetail(
      String? token, int id) async {
    final idPinjaman = id;
    final response = await _httpClient.post(
        Uri.parse('$baseUrl/pinjaman/get-detail-member/$idPinjaman'),
        headers: {
          'Authorization': 'Bearer ${token ?? " "}',
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponsePinjamanModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
