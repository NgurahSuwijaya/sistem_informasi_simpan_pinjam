import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_informasi_simpan_pinjam/domain/models/response_post_model.dart';
import '../../models/response_member_model.dart';
import '../../models/response_tagihan_angsuran_model.dart';
import '../../models/response_tagihan_simpanan_model.dart';
import '../../models/response_transaksi_saya_model.dart';
import '../error/exception.dart';

abstract class MemberDataSource {
  Future<ResponseMemberModel> onGetMemberdata(String? token, int? id);
  Future<ResponseTagihanAngsuranModel> onGetTagihanAngsuranMemberData(
      String? token);
  Future<ResponseTagihanSimpananModel> onGetTagihanSimpananWajibData(
      String? token);
  Future<ResponseTransaksiSayaModel> onGetTransaksiSaya(
      String? token, int page);
  Future<ResponsePostModel> onSetKontrolPenarikan(
      String? token, String? kontrol);
  Future<ResponsePostModel> onSetRekeningGiro(String? token, int? kontrol);
  Future<ResponsePostModel> onUpdatePhotoProfile(
      String? token, File photoProfile);
}

class MemberDataSourceImpl implements MemberDataSource {
  // static const baseUrl = "http://localhost:8000/api/member";
  static const baseUrl = "http://10.0.2.2:8000/api/member";
  final http.Client _httpClient;

  MemberDataSourceImpl(this._httpClient);

  @override
  Future<ResponseMemberModel> onGetMemberdata(String? token, int? id) async {
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/indexOneMember/$id?'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return ResponseMemberModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponseTagihanAngsuranModel> onGetTagihanAngsuranMemberData(
      String? token) async {
    final response = await _httpClient.get(
      Uri.parse('$baseUrl/member-tagihan-angsuran'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      print(response.body);

      if (responseBody != null && responseBody.isNotEmpty) {
        var decodedJson = json.decode(responseBody);
        print(decodedJson);
        var model = ResponseTagihanAngsuranModel.fromJson(decodedJson);
        print(model);
        return model;
      } else {
        throw Exception('Empty response body');
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponseTagihanSimpananModel> onGetTagihanSimpananWajibData(
      String? token) async {
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/member-tagihan-simpanan'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return ResponseTagihanSimpananModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponseTransaksiSayaModel> onGetTransaksiSaya(
      String? token, int page) async {
    final response =
        await _httpClient.get(Uri.parse('$baseUrl/transaksi-saya'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam =
          ResponseTransaksiSayaModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponseTransaksiSayaModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponsePostModel> onSetKontrolPenarikan(
      String? token, String? kontrol) async {
    final response = await _httpClient
        .post(Uri.parse('$baseUrl/set-kontrol-penarikan'), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'kontrol': kontrol
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam =
          ResponseTransaksiSayaModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponsePostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponsePostModel> onSetRekeningGiro(
      String? token, int? kontrol) async {
    final response = await _httpClient
        .post(Uri.parse('$baseUrl/set-rekening-giro'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    }, body: {
      'rekening_giro': kontrol
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam =
          ResponseTransaksiSayaModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponsePostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponsePostModel> onUpdatePhotoProfile(
      String? token, File photoProfile) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/update-profile?'));

    request.headers['Authorization'] = 'Bearer ${token ?? ""}';
    request.headers['Accept'] = 'application/json';

    String fileName = basename(photoProfile.path);
    request.files.add(await http.MultipartFile.fromPath(
      'photo_path',
      photoProfile.path,
      filename: fileName,
    ));

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
}
