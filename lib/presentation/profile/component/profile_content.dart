import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/profile/controllers/profile.controller.dart';

class ProfileContent extends StatelessWidget {
  final ProfileController profileController;
  const ProfileContent({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      // color: AppColor.green1,
      shadowColor: Colors.blueGrey,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: ListTile(
                leading: const Icon(CupertinoIcons.person_2_fill),
                title: Obx((() => Text(
                      profileController.memberProfileData.value.user.name,
                    ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: ListTile(
                leading: const Icon(CupertinoIcons.mail_solid),
                title: Obx((() => Text(
                      profileController.memberProfileData.value.user.email,
                    ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: ListTile(
                leading: const Icon(CupertinoIcons.house_fill),
                title: Obx((() => Text(
                      profileController
                          .memberProfileData.value.user.institutions.name,
                    ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: ListTile(
                leading: const Icon(CupertinoIcons.phone_fill),
                title: Obx((() => Text(
                      profileController
                          .memberProfileData.value.user.phoneNumber,
                    ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: ListTile(
                leading: Icon(CupertinoIcons.placemark_fill),
                title: Obx((() => Text(
                      profileController.memberProfileData.value.user.address,
                    ))),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
