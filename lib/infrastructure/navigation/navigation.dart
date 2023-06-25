import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
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
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
      binding: DashboardControllerBinding(),
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
