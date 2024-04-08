import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/angsuran/angsuran.screen.dart';
import '../../presentation/detail_angsuran/detail_angsuran.screen.dart';
import '../../presentation/detail_notification/detail_notification.screen.dart';
import '../../presentation/detail_pengajuan/detail_pengajuan.screen.dart';
import '../../presentation/detail_simpanan/detail_simpanan.screen.dart';
import '../../presentation/detail_simpanan_wajib/detail_simpanan_wajib.screen.dart';
import '../../presentation/detail_transaksi_angsuran/detail_transaksi_angsuran.screen.dart';
import '../../presentation/detail_transaksi_pinjaman/detail_transaksi_pinjaman.screen.dart';
import '../../presentation/detail_transaksi_simpanan/detail_transaksi_simpanan.screen.dart';
import '../../presentation/edit_profile/edit_profile.screen.dart';
import '../../presentation/history/history.screen.dart';
import '../../presentation/home/home.screen.dart';
import '../../presentation/kontrol_penarikan/kontrol_penarikan.screen.dart';
import '../../presentation/login/login.screen.dart';
import '../../presentation/notification/notification.screen.dart';
import '../../presentation/pengajuan/pengajuan.screen.dart';
import '../../presentation/pinjaman/pinjaman.screen.dart';
import '../../presentation/profile/profile.screen.dart';
import '../../presentation/setting/setting.screen.dart';
import '../../presentation/simpanan/simpanan.screen.dart';
import '../../presentation/simpanan_wajib/simpanan_wajib.screen.dart';
import '../../presentation/tagihan/tagihan.screen.dart';
import '../../presentation/transfer/transfer.screen.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationScreen(),
      binding: NotificationControllerBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileScreen(),
      binding: EditProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.SIMPANAN,
      page: () => const SimpananScreen(),
      binding: SimpananControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_SIMPANAN,
      page: () => const DetailSimpananScreen(),
      binding: DetailSimpananControllerBinding(),
    ),
    GetPage(
      name: Routes.PINJAMAN,
      page: () => const PinjamanScreen(),
      binding: PinjamanControllerBinding(),
    ),
    GetPage(
      name: Routes.PENGAJUAN,
      page: () => const PengajuanScreen(),
      binding: PengajuanControllerBinding(),
    ),
    GetPage(
      name: Routes.HISTORY,
      page: () => const HistoryScreen(),
      binding: HistoryControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_PENGAJUAN,
      page: () => const DetailPengajuanScreen(),
      binding: DetailPengajuanControllerBinding(),
    ),
    GetPage(
      name: Routes.ANGSURAN,
      page: () => AngsuranScreen(),
      binding: AngsuranControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_ANGSURAN,
      page: () => const DetailAngsuranScreen(),
      binding: DetailAngsuranControllerBinding(),
    ),
    GetPage(
      name: Routes.TAGIHAN,
      page: () => const TagihanScreen(),
      binding: TagihanControllerBinding(),
    ),
    GetPage(
      name: Routes.SIMPANAN_WAJIB,
      page: () => const SimpananWajibScreen(),
      binding: SimpananWajibControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_SIMPANAN_WAJIB,
      page: () => const DetailSimpananWajibScreen(),
      binding: DetailSimpananWajibControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_TRANSAKSI_SIMPANAN,
      page: () => const DetailTransaksiSimpananScreen(),
      binding: DetailTransaksiSimpananControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_TRANSAKSI_PINJAMAN,
      page: () => const DetailTransaksiPinjamanScreen(),
      binding: DetailTransaksiPinjamanControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_TRANSAKSI_ANGSURAN,
      page: () => const DetailTransaksiAngsuranScreen(),
      binding: DetailTransaksiAngsuranControllerBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_NOTIFICATION,
      page: () => const DetailNotificationScreen(),
      binding: DetailNotificationControllerBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => const SettingScreen(),
      binding: SettingControllerBinding(),
    ),
    GetPage(
      name: Routes.TRANSFER,
      page: () => const TransferScreen(),
      binding: TransferControllerBinding(),
    ),
    GetPage(
      name: Routes.KONTROL_PENARIKAN,
      page: () => const KontrolPenarikanScreen(),
      binding: KontrolPenarikanControllerBinding(),
    ),
  ];
}
