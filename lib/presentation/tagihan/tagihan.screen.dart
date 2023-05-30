import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/tagihan/component/tagihan_header.dart';

import 'component/tagihan_content.dart';
import 'controllers/tagihan.controller.dart';

class TagihanScreen extends GetView<TagihanController> {
  const TagihanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tagihan Online'),
          centerTitle: true,
        ),
        body: Obx((() => controller.isLoading.value
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const TagihanHeader(),
                        TagihanContent(controller: controller),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ))));
  }
}
