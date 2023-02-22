import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/angsuran_menurun.controller.dart';

class AngsuranMenurunScreen extends GetView<AngsuranMenurunController> {
  const AngsuranMenurunScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AngsuranMenurunScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AngsuranMenurunScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
