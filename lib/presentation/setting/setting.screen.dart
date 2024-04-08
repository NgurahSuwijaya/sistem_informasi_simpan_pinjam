import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_alert_dialog.dart';
import '../../widget/app_ok_dialog.dart';
import 'controllers/setting.controller.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: CircleAvatar(
                      backgroundColor: AppColor.blackComponent,
                      backgroundImage: NetworkImage(
                          'http://10.0.2.2:8000${controller.photoPath}'),
                      minRadius: 40,
                      maxRadius: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.name.value,
                      style: const TextStyle(
                        color: AppColor.green1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.nia.value,
                      style: const TextStyle(
                        color: AppColor.green1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.toNamed("/profile"),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // color: AppColor.green1,
                      shadowColor: Colors.blueGrey,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.person_fill,
                                  color: AppColor.gray2,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Profil",
                                  style: AppFont.title1,
                                ),
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              size: 16,
                            )
                          ],
                        ),
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
                                  bottom: BorderSide(
                                      width: 1.0, color: AppColor.gray5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.gear_solid,
                                      color: AppColor.gray2,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Pengaturan",
                                      style: AppFont.title1,
                                    ),
                                  ],
                                ),
                              )),
                          Obx((() => controller.isInstitusiRekeninGiro.value
                              ? Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: AppColor.gray5),
                                    ),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Obx((() => SwitchListTile(
                                          activeColor: AppColor.green1,
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(
                                            "Rekening Giro",
                                            style: AppFont.subtitle1,
                                          ),
                                          value: controller.isRekeninGiro.value,
                                          onChanged: ((value) {
                                            if (value == true) {
                                              Get.dialog(AppAlertDialog(
                                                  onPressed: () => {
                                                        Get.back(),
                                                        controller
                                                            .onActiveRekeningGiro()
                                                      },
                                                  title: "Rekening",
                                                  content:
                                                      "Apakah anda akan mengaktifkan rekening giro?"));
                                            } else {
                                              if (controller.saldoGiro.value ==
                                                  0) {
                                                Get.dialog(AppAlertDialog(
                                                    onPressed: () => {
                                                          controller
                                                              .onGiroChange(
                                                                  value),
                                                          Get.back(),
                                                          controller
                                                              .setRekeningGiro()
                                                        },
                                                    title: "Rekening Giro",
                                                    content:
                                                        "Apakah anda akan mengnonaktifkan layanan rekening giro?"));
                                              } else {
                                                Get.dialog(AppOkeDialog(
                                                    onPressed: () => Get.back(),
                                                    title: "Rekening Giro",
                                                    content:
                                                        "Anda masih mempunyai saldo giro yang tersisa maka anda tidak bisa melakukan penutupan rekening giro"));
                                              }
                                            }
                                          }))))))
                              : const SizedBox())),
                          Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: AppColor.gray5),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Obx((() => SwitchListTile(
                                    activeColor: AppColor.green1,
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      "Kontrol Penarikan Mobile",
                                      style: AppFont.subtitle1,
                                    ),
                                    value:
                                        controller.kontrolPenarikanValue.value,
                                    onChanged: ((value) {
                                      if (value == true) {
                                        Get.dialog(CupertinoAlertDialog(
                                          title:
                                              const Text("Kontrol penarikan"),
                                          content: const Text(
                                              "Apakah anda mengijinkan penarikan simpanan?"),
                                          actions: <Widget>[
                                            CupertinoDialogAction(
                                              child: const Text('Batal'),
                                              onPressed: () {
                                                controller
                                                    .onKontrolChange(!value);
                                                Get.back();
                                              },
                                            ),
                                            CupertinoDialogAction(
                                              onPressed: (() {
                                                controller
                                                    .onKontrolChange(value);
                                                controller
                                                    .setKontrolPenarikan();
                                                Get.back();
                                              }),
                                              child: const Text('Terima'),
                                            ),
                                          ],
                                        ));
                                      } else {
                                        Get.dialog(AppAlertDialog(
                                            onPressed: () => {
                                                  Get.back(),
                                                  controller
                                                      .onKontrolChange(value),
                                                  controller
                                                      .setKontrolPenarikan()
                                                },
                                            title: "Kontrol Penarikan",
                                            content:
                                                "Apakah anda akan mematikan kontrol penarikan moble?"));
                                      }
                                    })))),
                              )),
                          // Container(
                          //     width: double.infinity,
                          //     decoration: const BoxDecoration(
                          //       border: Border(
                          //         bottom: BorderSide(
                          //             width: 1.0, color: AppColor.gray5),
                          //       ),
                          //     ),
                          //     child: Padding(
                          //       padding:
                          //           const EdgeInsets.symmetric(horizontal: 20),
                          //       child: SwitchListTile(
                          //           activeColor: AppColor.green1,
                          //           contentPadding: EdgeInsets.zero,
                          //           title: Text(
                          //             "Notifikasi Mobile",
                          //             style: AppFont.subtitle1,
                          //           ),
                          //           value: true,
                          //           onChanged: ((value) {})),
                          //     )),
                        ],
                      )),
                ),
                InkWell(
                  onTap: () => Get.dialog(AppAlertDialog(
                    title: "Pemberitahuan!",
                    content: "Apakah anda ingin keluar dari akun ini ?",
                    onPressed: () => controller.logOut(),
                  )),
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: AppColor.sRed,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // color: AppColor.green1,
                      shadowColor: Colors.blueGrey,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.logout,
                                  color: AppColor.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Keluar Akun",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: AppColor.white,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
