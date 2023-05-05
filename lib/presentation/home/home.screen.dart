import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_header.dart';

import '../../infrastructure/theme/app_color.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray3,
        body: Obx(
          () => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: Column(
                      children: [
                        HomeHeader(
                          controller: controller,
                        ),
                        HomeContent(
                          homeController: controller,
                        ),
                        HomeFooter(
                          homeController: controller,
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
