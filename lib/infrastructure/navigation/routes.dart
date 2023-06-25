// ignore_for_file: constant_identifier_names

import '../../utils/helpers/helpers.dart';

class Routes {
  static Future<String> get initialRoute async {
    bool isLoggedIn = await checkLoginStatus();
    // Jika sudah login, arahkan ke halaman home, jika belum, arahkan ke halaman login
    return isLoggedIn ? HOME : LOGIN;
  }

  static const ANGSURAN = '/angsuran';
  static const ANGSURAN_MENETAP = '/angsuran-menetap';
  static const ANGSURAN_MENURUN = '/angsuran-menurun';
  static const DASHBOARD = '/dashboard';
  static const DETAIL_ANGSURAN = '/detail-angsuran';
  static const DETAIL_NOTIFICATION = '/detail-notification';
  static const DETAIL_PENGAJUAN = '/detail-pengajuan';
  static const DETAIL_SIMPANAN = '/detail-simpanan';
  static const DETAIL_SIMPANAN_WAJIB = '/detail-simpanan-wajib';
  static const DETAIL_TRANSAKSI = '/detail-transaksi';
  static const DETAIL_TRANSAKSI_ANGSURAN = '/detail-transaksi-angsuran';
  static const DETAIL_TRANSAKSI_PINJAMAN = '/detail-transaksi-pinjaman';
  static const DETAIL_TRANSAKSI_SIMPANAN = '/detail-transaksi-simpanan';
  static const EDIT_PROFILE = '/edit-profile';
  static const HISTORY = '/history';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const NOTIFICATION = '/notification';
  static const PENGAJUAN = '/pengajuan';
  static const PINJAMAN = '/pinjaman';
  static const PROFILE = '/profile';
  static const SETTING = '/setting';
  static const SIMPANAN = '/simpanan';
  static const SIMPANAN_WAJIB = '/simpanan-wajib';
  static const TAGIHAN = '/tagihan';
  static const TRANSFER = '/transfer';
  static const KONTROL_PENARIKAN = '/kontrol-penarikan';
}
