import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/angsuran/component/angsuran_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/angsuran/component/angsuran_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/angsuran/component/angsuran_header.dart';
import 'controllers/angsuran.controller.dart';

class AngsuranScreen extends GetView<AngsuranController> {
  AngsuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    ResponseTagihanAngsuran responseTagihanAngsuran = argument!;
    print(responseTagihanAngsuran);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Angsuran Online'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AngsuranHeader(
                    controller: controller,
                    responseTagihanAngsuran: responseTagihanAngsuran),
                const SizedBox(
                  height: 10,
                ),
                AngsuranContent(
                    controller: controller,
                    responseTagihanAngsuran: responseTagihanAngsuran),
                const SizedBox(
                  height: 20,
                ),
                AngsuranFooter(
                  controller: controller,
                  responseTagihanAngsuran: responseTagihanAngsuran,
                ),
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
