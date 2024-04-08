import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/pengajuan_content.dart';
import 'component/pengajuan_footer.dart';
import 'component/pengajuan_header.dart';
import 'controllers/pengajuan.controller.dart';

class PengajuanScreen extends GetView<PengajuanController> {
  const PengajuanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Pinjaman'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const PengajuanHeader(),
                PengajuanContent(
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                PengajuanFooter(
                  controller: controller,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
