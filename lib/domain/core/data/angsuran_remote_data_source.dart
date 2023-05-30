import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_post.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:http/http.dart' as http;

import '../../models/response_post_model.dart';
import '../error/exception.dart';

abstract class AngsuranDataSource {
  Future<ResponsePostModel> onPostBayarAngsuran(
      String? token,
      ResponseTagihanAngsuran responseTagihanAngsuran,
      int jumlah,
      File? buktiBayar);
}

class AngsuranDataSourceImpl implements AngsuranDataSource {
  static const baseUrl = "http://localhost:8000/api/angsuran";
  final http.Client _httpClient;

  AngsuranDataSourceImpl(this._httpClient);

  @override
  Future<ResponsePostModel> onPostBayarAngsuran(
      String? token,
      ResponseTagihanAngsuran responseTagihanAngsuran,
      int jumlah,
      File? buktiBayar) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/store-member?'));

    request.headers['Authorization'] = 'Bearer ${token ?? ""}';
    request.headers['Accept'] = 'application/json';
    print(token);

    if (buktiBayar != null) {
      String fileName = basename(buktiBayar.path);
      request.files.add(await http.MultipartFile.fromPath(
        'bukti_pembayaran',
        buktiBayar.path,
        filename: fileName,
      ));
    }

    int pembayaranPokok = jumlah -
        (responseTagihanAngsuran.totalBunga!.toInt() +
            responseTagihanAngsuran.totalAdmin!.toInt() +
            responseTagihanAngsuran.totalPenalti!.toInt());

    request.fields['pinjaman_id'] =
        responseTagihanAngsuran.tagihanAngsuran![0].pinjamanId.toString();
    request.fields['angsuran_ke'] =
        responseTagihanAngsuran.tagihanAngsuran![0].angsuranKe.toString();
    request.fields['pokok_bulan_ini'] =
        responseTagihanAngsuran.tagihanAngsuran![0].tagihanPokok.toString();
    request.fields['bunga_bulan_ini'] =
        responseTagihanAngsuran.tagihanAngsuran![0].tagihanBunga.toString();
    request.fields['administrasi_bulan_ini'] =
        responseTagihanAngsuran.tagihanAngsuran![0].tagihanAdmin.toString();
    request.fields['pinalti_bulan_ini'] =
        responseTagihanAngsuran.tagihanAngsuran![0].tagihanPenalti.toString();
    request.fields['tambahan_pinjaman'] = 0.toString();
    request.fields['pembayaran_pokok'] = pembayaranPokok.toString();
    request.fields['pembayaran_bunga'] =
        responseTagihanAngsuran.totalBunga.toString();
    request.fields['pembayaran_administrasi'] =
        responseTagihanAngsuran.totalAdmin.toString();
    request.fields['pembayaran_penalti'] =
        responseTagihanAngsuran.totalPenalti.toString();

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
