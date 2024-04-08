import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_bottom_sheet.dart';
import '../controllers/profile.controller.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileController controller;

  const ProfileHeader({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: Card(
                shape: CircleBorder(),
                elevation: 5,
                child: CircleAvatar(
                  backgroundColor: AppColor.blackComponent,
                  backgroundImage: NetworkImage(
                      'http://10.0.2.2:8000${controller.memberProfileData.value.user.photoPath}'),
                  minRadius: 60,
                  maxRadius: 80,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipOval(
                child: Card(
                  color: AppColor.green1,
                  shape: CircleBorder(),
                  elevation: 4,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    onPressed: () {
                      Get.bottomSheet(
                          AppBottomSheet(
                            context,
                            onPressedCamera: () =>
                                controller.selectImageCamera(),
                            onPressedGallery: () =>
                                {controller.selectImageGalery()},
                          ),
                          backgroundColor: AppColor.white);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(
          (() => Text(
                controller.memberProfileData.value.nomorIndukAnggota,
                style: const TextStyle(
                  color: AppColor.green1,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
      ],
    );
  }
}
