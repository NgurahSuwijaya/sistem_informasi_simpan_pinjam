import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_simpanan.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan_wajib/component/simpanan_wajib_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan_wajib/component/simpanan_wajib_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan_wajib/component/simpanan_wajib_header.dart';
import 'controllers/simpanan_wajib.controller.dart';

class SimpananWajibScreen extends GetView<SimpananWajibController> {
  const SimpananWajibScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    ResponseTagihanSimpanan responseTagihanSimpanan = argument;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simpanan Wajib'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpananWajibHeader(
                    controller: controller,
                    responseTagihanSimpanan: responseTagihanSimpanan),
                const SizedBox(
                  height: 10,
                ),
                SimpananWajibContent(
                    controller: controller,
                    responseTagihanSimpanan: responseTagihanSimpanan),
                const SizedBox(
                  height: 20,
                ),
                SimpananWajibFooter(
                    controller: controller,
                    responseTagihanSimpanan: responseTagihanSimpanan),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
