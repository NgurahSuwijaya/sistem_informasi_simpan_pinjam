import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan/component/simpanan_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan/component/simpanan_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan/component/simpanan_header.dart';

import 'controllers/simpanan.controller.dart';

class SimpananScreen extends GetView<SimpananController> {
  const SimpananScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray3,
        appBar: AppBar(
          title: const Text('Simpanan'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SimpananHeader(),
                  SimpananContent(controller: controller),
                  SimpananFooter(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
