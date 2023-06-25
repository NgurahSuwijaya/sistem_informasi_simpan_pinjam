import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/core/usecase/my_notification_usecase.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/my_notification.dart';

class NotificationController extends GetxController {
  final MyNotificationUseCase myNotificationUseCase;
  final RxInt halamanSaatIni = 1.obs;
  final RxInt to = 1.obs;
  final RxInt responseCurrentPage = 1.obs;
  final RxInt total = 1.obs;
  final RxInt length = 1.obs;
  final RxBool isTidakAdaNotif = false.obs;
  bool isHasNextPage = false;
  RxList<MyNotification> myAllNotification = <MyNotification>[].obs;
  final isLoadingData = false.obs;
  final scrollController = ScrollController();

  NotificationController(this.myNotificationUseCase);

  @override
  void onInit() {
    super.onInit();
    getMyNotification();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLoadingData.value) {
          loadDataAfterScroll();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
    super.onClose();
  }

  Future<void> getMyNotification() async {
    isLoadingData.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await myNotificationUseCase.onGetTransaksiSaya(
        token: token, page: halamanSaatIni.value);
    result.fold(
        (l) => {Get.snackbar("Error", l.message), print(l.message)},
        (r) => {
              myAllNotification.addAll([...r.data!.data!]),
              total.value = r.data!.total!,
              length.value = myAllNotification.length,
              isLoadingData.value = false,
              if (myAllNotification.isEmpty)
                {isTidakAdaNotif.value = true}
              else
                {isTidakAdaNotif.value = false},
              if (r.data?.nextPageUrl != null) {isHasNextPage = true},
            });
  }

  Future<void> goToDetail(MyNotification myNotification) async {
    isLoadingData.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    final result = await myNotificationUseCase.onReadNotification(
        token: token, id: myNotification.id!);
    result.fold(
        (l) => Get.snackbar("Error", l.message),
        (r) => {
              print(r),
              isLoadingData.value = false,
              Get.offNamed('/detail-notification', arguments: myNotification)
            });
  }

  void loadDataAfterScroll() {
    if (isHasNextPage) {
      halamanSaatIni.value++;
      getMyNotification();
    }
  }
}
