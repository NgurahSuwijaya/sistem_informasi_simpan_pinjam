import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/angsuran.controller.dart';

class AngsuranScreen extends GetView<AngsuranController> {
  const AngsuranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AngsuranScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AngsuranScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
