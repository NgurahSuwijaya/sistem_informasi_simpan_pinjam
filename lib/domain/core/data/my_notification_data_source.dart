import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/my_notification_model.dart';
import '../../models/response_post_model.dart';
import '../error/exception.dart';

abstract class MyNotificationDataSource {
  Future<ResponseMyNotificationModel> onGetMyNotification(
      String? token, int page);
  Future<ResponsePostModel> onReadNotification(String? token, int id);
  Future<ResponsePostModel> onDeleteNotification(String? token, int id);
}

class MyNotificationDataSourceImpl implements MyNotificationDataSource {
  // static const baseUrl = "http://localhost:8000/api/notifikasi-saya";
  static const baseUrl = "http://10.0.2.2:8000/api/notifikasi-saya";
  final http.Client _httpClient;

  MyNotificationDataSourceImpl(this._httpClient);

  @override
  Future<ResponseMyNotificationModel> onGetMyNotification(
      String? token, int page) async {
    final response =
        await _httpClient.get(Uri.parse('$baseUrl/index'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam =
          ResponseMyNotificationModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponseMyNotificationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<ResponsePostModel> onDeleteNotification(String? token, int id) async {
    final response =
        await _httpClient.post(Uri.parse('$baseUrl/delete/$id'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam = ResponsePostModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponsePostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }

  @override
  Future<ResponsePostModel> onReadNotification(String? token, int id) async {
    final response =
        await _httpClient.post(Uri.parse('$baseUrl/edit/$id'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var ayam = ResponsePostModel.fromJson(json.decode(response.body));
      print(ayam);
      return ResponsePostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.body);
    }
  }
}
