import 'dart:convert';

import 'package:sistem_informasi_simpan_pinjam/domain/models/response_pinjaman_model.dart';
import 'package:http/http.dart' as http;

import '../error/exception.dart';

abstract class PinjamanDataSource {
  Future<ResponsePinjamanModel> onGetPinjamanData(String? token);
}

class PinjamanDataSourceImpl implements PinjamanDataSource {
  static const baseUrl = "http://localhost:8000/api";
  final http.Client _httpClient;

  PinjamanDataSourceImpl(this._httpClient);

  @override
  Future<ResponsePinjamanModel> onGetPinjamanData(String? token) async {
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/pinjaman/index-member?'), headers: {
      'Authorization': 'Bearer ${token ?? " "}',
      'Content-Type': 'application/json',
    });
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      print("ayam");
      var ayam = ResponsePinjamanModel.fromJson(json.decode(response.body));
      print(ayam.data.id);
      return ResponsePinjamanModel.fromJson(json.decode(response.body));
      // } else if(response.statusCode == 401){
      //   return
    } else {
      throw ServerException();
    }
  }
}
