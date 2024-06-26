import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'component/pinjaman_content.dart';
import 'component/pinjaman_footer.dart';
import 'component/pinjaman_header.dart';
import 'component/pinjaman_tidak_ada.dart';
import 'controllers/pinjaman.controller.dart';

class PinjamanScreen extends GetView<PinjamanController> {
  const PinjamanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Informasi Pinjaman'),
          centerTitle: true,
        ),
        body: Obx((() => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 10),
                      child: Obx((() => controller.isMeminjam
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                PinjamanHeader(controller: controller),
                                PinjamanContent(controller: controller),
                                PinjamanFooter(controller: controller),
                                const SizedBox(
                                  height: 100,
                                )
                              ],
                            )
                          : PinjamanTidakAda()))),
                ),
              ))));
  }
}
