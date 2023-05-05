import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/edit_profile/component/edit_profile_content.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/edit_profile/component/edit_profile_footer.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/edit_profile/component/edit_profile_header.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_card_button.dart';

import 'controllers/edit_profile.controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.gray3,
        appBar: AppBar(
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  EditProfileHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  EditProfileContent(),
                  EditProfileFooter(),
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
