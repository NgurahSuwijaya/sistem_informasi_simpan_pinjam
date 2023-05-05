import 'dart:convert';
import 'package:sistem_informasi_simpan_pinjam/domain/models/response_login_model.dart';
import 'package:http/http.dart' as http;
import '../error/exception.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> onLoginUser(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  static const baseUrl = "http://localhost:8000/api";
  final http.Client _httpClient;

  AuthDataSourceImpl(this._httpClient);

  @override
  Future<LoginResponseModel> onLoginUser(String email, String password) async {
    final response = await _httpClient.post(Uri.parse('$baseUrl/login'), body: {
      'email': email,
      'password': password,
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var dia = LoginResponseModel.fromJson(json.decode(response.body));
      print(dia);
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
