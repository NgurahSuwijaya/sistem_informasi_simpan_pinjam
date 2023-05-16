import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/home/component/home_header.dart';

import '../../infrastructure/theme/app_color.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _refresh() async {
    await controller
        .getSimpanan(); // Call the fetchData function from your controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray3,
        body: Obx(
          () => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: _refresh,
                  child: SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Column(
                        children: [
                          HomeHeader(
                            controller: controller,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          HomeContent(
                            homeController: controller,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          HomeFooter(
                            homeController: controller,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
