import 'dart:convert';

import 'package:sistem_informasi_simpan_pinjam/domain/models/response_simpanan_model.dart';
import 'package:http/http.dart' as http;

import '../error/exception.dart';

abstract class SimpananDataSource {
  Future<ResponseSimpananModel> onGetSimpananData(String? token);
}

class SimpananDataSourceImpl implements SimpananDataSource {
  static const baseUrl = "http://localhost:8000/api";
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
    print(response.body.runtimeType);
    if (response.statusCode == 200) {
      print("ayam");
      var ayam = ResponseSimpananModel.fromJson(json.decode(response.body));
      print(ayam.data.id);
      return ResponseSimpananModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
