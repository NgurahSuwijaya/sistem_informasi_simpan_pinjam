import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../infrastructure/theme/app_font.dart';
import 'component/history_content.dart';
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
