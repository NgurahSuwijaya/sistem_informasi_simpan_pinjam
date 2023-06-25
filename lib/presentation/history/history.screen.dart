import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_transaksi_saya.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/history/component/history_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/history/component/history_header.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_transaksi_card.dart';

import '../../infrastructure/theme/app_font.dart';
import 'controllers/history.controller.dart';

class HistoryScreen extends GetView<HistoryController> {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Saya'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // HistoryHeader(controller: controller),
                SizedBox(
                  height: 10,
                ),
                HistoryContent(controller: controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
