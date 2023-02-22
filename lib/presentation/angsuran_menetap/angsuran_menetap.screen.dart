import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/angsuran_menetap.controller.dart';

class AngsuranMenetapScreen extends GetView<AngsuranMenetapController> {
  const AngsuranMenetapScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AngsuranMenetapScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AngsuranMenetapScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
