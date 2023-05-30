import 'dart:convert';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/models/member_model.dart';
import 'package:http/http.dart' as http;
import '../../models/response_member_model.dart';
import '../../models/response_tagihan_angsuran_model.dart';
import '../../models/response_tagihan_simpanan_model.dart';
import '../error/exception.dart';

abstract class MemberDataSource {
  Future<ResponseMemberModel> onGetMemberdata(String? token, int? id);
  Future<ResponseTagihanAngsuranModel> onGetTagihanAngsuranMemberData(
      String? token);
  Future<ResponseTagihanSimpananModel> onGetTagihanSimpananWajibData(
      String? token);
}

class MemberDataSourceImpl implements MemberDataSource {
  static const baseUrl = "http://localhost:8000/api/member";
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
    final response = await _httpClient
        .get(Uri.parse('$baseUrl/member-tagihan-angsuran'), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponseTagihanAngsuranModel.fromJson(json.decode(response.body));
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
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return ResponseTagihanSimpananModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
