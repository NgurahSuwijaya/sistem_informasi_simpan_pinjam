import 'dart:convert';

import 'package:sistem_informasi_simpan_pinjam/domain/models/response_bank_model.dart';
import 'package:http/http.dart' as http;

import '../error/exception.dart';

abstract class BankDataSource {
  Future<ResponseBankModel> onGetBankData(String? token);
}

class BankDataSourceImpl implements BankDataSource {
  static const baseUrl = "http://localhost:8000/api/bank";
  final http.Client _httpClient;

  BankDataSourceImpl(this._httpClient);

  @override
  Future<ResponseBankModel> onGetBankData(String? token) async {
    final response =
        await _httpClient.get(Uri.parse('$baseUrl/indexMember'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam = ResponseBankModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponseBankModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
