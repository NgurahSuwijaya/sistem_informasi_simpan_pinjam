import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/pengajuan.controller.dart';

class PengajuanScreen extends GetView<PengajuanController> {
  const PengajuanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengajuanScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PengajuanScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
