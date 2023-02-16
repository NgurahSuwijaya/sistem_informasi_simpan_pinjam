import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_input.dart';

import '../../../infrastructure/theme/app_color.dart';

class EditProfileContent extends StatelessWidget {
  const EditProfileContent({super.key});

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
            children: [
              AppInput(
                topText: "Nama",
                hint: "Nama",
                canEdit: true,
                obscureText: false,
                prefixIcons: Icon(CupertinoIcons.person_2_fill),
              ),
              SizedBox(
                height: 10,
              ),
              AppInput(
                topText: "Email",
                hint: "Email",
                canEdit: true,
                obscureText: false,
                prefixIcons: Icon(CupertinoIcons.mail_solid),
              ),
              SizedBox(
                height: 10,
              ),
              AppInput(
                  topText: "Instansi",
                  hint: "Instansi",
                  canEdit: true,
                  obscureText: false,
                  prefixIcons: Icon(CupertinoIcons.house_fill)),
              SizedBox(
                height: 10,
              ),
              AppInput(
                  topText: "Telepon",
                  canEdit: true,
                  hint: "Telepon",
                  obscureText: false,
                  prefixIcons: Icon(CupertinoIcons.phone_fill)),
              SizedBox(
                height: 10,
              ),
              AppInput(
                  topText: "Alamat",
                  hint: "Alamat",
                  canEdit: true,
                  obscureText: false,
                  prefixIcons: Icon(CupertinoIcons.placemark_fill))
            ],
          )),
    );
  }
}
