import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/profile/component/profile_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/profile/component/profile_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/profile/component/profile_header.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray3,
        appBar: AppBar(
          title: const Text('Profil'),
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileHeader(
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ProfileContent(
                        profileController: controller,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfileFooter(
                        profileController: controller,
                      )
                    ],
                  ),
                ),
              )));
  }
}
