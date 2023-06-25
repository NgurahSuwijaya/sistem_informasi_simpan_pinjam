import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_bottom_sheet.dart';

class EditProfileHeader extends StatefulWidget {
  const EditProfileHeader({super.key});

  @override
  State<EditProfileHeader> createState() => _EditProfileHeaderState();
}

class _EditProfileHeaderState extends State<EditProfileHeader> {
  // late String base64string;
  // File? image;

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);

  //     if (image == null) return;
  //     final temporaryImage = File(image.path);

  //     Uint8List imageBytes = await temporaryImage.readAsBytes();

  //     setState(() {
  //       base64string = base64.encode(imageBytes);
  //       this.image = temporaryImage;
  //     });
  //   } on PlatformException catch (e) {
  //     print("Failed to load image:$e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: CircleAvatar(
                backgroundColor: AppColor.blackComponent,
                backgroundImage: NetworkImage(
                    'https://cdn.discordapp.com/attachments/856786757516918784/1057564396194373632/Screenshot_20221228_154104_WhatsApp.jpg'),
                minRadius: 60,
                maxRadius: 70,
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shadowColor: Colors.blueGrey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: IconButton(
                  onPressed: (() {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => AppBottomSheet(context));
                  }),
                  icon: Icon(CupertinoIcons.camera_fill),
                  color: AppColor.blackComponent,
                  iconSize: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "1905551104",
          style: TextStyle(
              color: AppColor.green1,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
