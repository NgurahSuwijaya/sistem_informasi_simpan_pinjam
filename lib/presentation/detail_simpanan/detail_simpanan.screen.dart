import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/detail_simpanan.controller.dart';

class DetailSimpananScreen extends GetView<DetailSimpananController> {
  const DetailSimpananScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailSimpananScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailSimpananScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
