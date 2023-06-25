import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';

import '../../infrastructure/theme/app_font.dart';
import 'controllers/detail_notification.controller.dart';

class DetailNotificationScreen extends GetView<DetailNotificationController> {
  const DetailNotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Get.offNamed('/notification');
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 25),
                  child: Row(
                    children: [
                      controller.title.value == 'Diterima'
                          ? const Icon(
                              CupertinoIcons.checkmark_alt_circle,
                              color: AppColor.green1,
                              size: 35,
                            )
                          : controller.title.value == "Ditolak"
                              ? const Icon(
                                  CupertinoIcons.exclamationmark_triangle_fill,
                                  color: AppColor.sRed,
                                  size: 35,
                                )
                              : const Icon(
                                  CupertinoIcons.mail_solid,
                                  color: AppColor.sBlue,
                                  size: 35,
                                ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.myAllNotification.value!.title!,
                        style: AppFont.title1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // color: AppColor.green1,
                shadowColor: Colors.blueGrey,
                elevation: 3,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: AppColor.gray5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            controller.myAllNotification.value!.subject!,
                            style: AppFont.title1,
                          ),
                        )),
                    Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: AppColor.gray5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            controller.myAllNotification.value!.content!,
                            style: AppFont.title3,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppButton(
              text: "Kembali",
              color: AppColor.sRed,
              onPressed: () {
                Get.offNamed('notification');
              },
            )
          ],
        ),
      ),
    );
  }
}
