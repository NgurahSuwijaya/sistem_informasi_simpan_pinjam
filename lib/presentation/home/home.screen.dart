import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_header.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Column(
            children: const [HomeHeader(), HomeContent(), HomeFooter()],
          ),
        ),
      ),
    );
  }
}
