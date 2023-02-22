import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pinjaman/component/pinjaman_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pinjaman/component/pinjaman_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pinjaman/component/pinjaman_header.dart';

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
                  PinjamanHeader(),
                  PinjamanContent(),
                  PinjamanFooter(),
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
