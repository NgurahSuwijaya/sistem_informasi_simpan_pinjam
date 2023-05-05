// import 'dart:convert';

// import '../../entities/user.dart';
// import '../../models/response_login.dart';
// import '../../models/user_model.dart';
// import '../repositories/user_repository.dart';
// import 'package:http/http.dart' as http;

// class UserRepositoryImpl implements UserRepository {
//   static const BASE_URL = "localhost:8000/api/";
//   final http.Client _httpClient;

//   UserRepositoryImpl(this._httpClient);

//   @override
//   // Future<List<UserModel>> getUser({String? token, int? id}) async {
//   //   final response = await _httpClient
//   //       .get(Uri.parse('$BASE_URL/member/index/$id?'), headers: {
//   //     'Authorization': 'Bearer $token',
//   //     'Content-Type': 'application/json',
//   //   });

//   //   if (response.statusCode == 200) {
//   //     final List<dynamic> jsonList = json.decode(response.body);
//   //     final List<User> users = jsonList.map((e) => User.fromJson(e)).toList();
//   //     return users;
//   //   } else {
//   //     throw Exception('Failed to load users');
//   //   }
//   // }
// }
