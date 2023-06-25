import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_card_notification.dart';
import 'controllers/notification.controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Notification'),
            centerTitle: true,
            leading: IconButton(
                icon: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Get.offNamed('/home');
                })),
        body: controller.isTidakAdaNotif.value
            ? const Center(
                child: Text("Belum ada notifikasi"),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Obx((() => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.myAllNotification.length,
                          itemBuilder: (context, index) {
                            final myNotification =
                                controller.myAllNotification.value[index];
                            return AppCardNotification(
                              isReaded:
                                  myNotification.isReaded == 0 ? false : true,
                              title: myNotification.title!,
                              subject: myNotification.subject!,
                              onPressed: () =>
                                  controller.goToDetail(myNotification),
                            );
                          },
                        ))),
                    const SizedBox()
                  ],
                ),
              ));
  }
}
