import 'dart:convert';
import 'package:sistem_informasi_simpan_pinjam/domain/models/response_login_model.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_informasi_simpan_pinjam/domain/models/response_post_model.dart';
import '../error/exception.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> onLoginUser(
      String email, String password, String fcmToken);
  Future<ResponsePostModel> onLogOutUser(String? token);
}

class AuthDataSourceImpl implements AuthDataSource {
  // static const baseUrl = "http://localhost:8000/api";
  static const baseUrl = "http://10.0.2.2:8000/api";
  final http.Client _httpClient;

  AuthDataSourceImpl(this._httpClient);

  @override
  Future<LoginResponseModel> onLoginUser(
      String email, String password, String fcmToken) async {
    final response = await _httpClient.post(Uri.parse('$baseUrl/login'),
        body: json.encode(
            {'email': email, 'password': password, 'fcm_token': fcmToken}),
        headers: {
          'Content-Type': 'application/json',
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

  @override
  Future<ResponsePostModel> onLogOutUser(String? token) async {
    final response = await _httpClient
        .post(Uri.parse('$baseUrl/member/logout-member'), headers: {
      'Authorization': 'Bearer ${token ?? " "}',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponsePostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
