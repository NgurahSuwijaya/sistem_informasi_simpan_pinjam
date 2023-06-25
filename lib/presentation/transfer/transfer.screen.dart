import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';

import '../../infrastructure/theme/app_color.dart';
import '../../infrastructure/theme/app_font.dart';
import '../../widget/app_input.dart';
import 'controllers/transfer.controller.dart';

class TransferScreen extends GetView<TransferController> {
  const TransferScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Column(
            children: [
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
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Transfer antar anggota",
                      style: AppFont.title1,
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
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        AppInput(
                          topText: "Tanggal Transaksi",
                          hint: "Tanggal Sekarang",
                          canEdit: false,
                          obscureText: false,
                          value: formattedDate,
                          textInputType: TextInputType.datetime,
                          prefixIcons:
                              const Icon(CupertinoIcons.calendar_today),
                          isCurrency: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppInput(
                          controller: controller.niaTransferController,
                          topText: "Masukan Nomor Induk Penerima",
                          hint: "Nomor Induk Penerima",
                          canEdit: true,
                          obscureText: false,
                          isCurrency: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppInput(
                          controller: controller.nominalTransferController,
                          topText: "Nominal Transfer",
                          hint: "Nominal Transfer",
                          canEdit: true,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          isCurrency: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx((() => AppInput(
                              controller: controller.passwordController,
                              topText: "Password Akun",
                              hint: "Password Akun",
                              canEdit: true,
                              obscureText: controller.isPasswordInvisible.value,
                              sufixIcons: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: (() =>
                                      controller.onPasswordVisible()),
                                  icon: Icon(
                                    controller.isPasswordInvisible.value
                                        ? Icons.remove_red_eye
                                        : CupertinoIcons.eye_slash_fill,
                                    color: AppColor.gray2,
                                    size: 20,
                                  )),
                              isCurrency: false,
                            ))),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                text: "Kirim",
                color: AppColor.green1,
                onPressed: () {
                  controller.onPressKirim();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
