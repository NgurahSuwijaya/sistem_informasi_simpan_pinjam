import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

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
              child: const ListTile(
                leading: Icon(CupertinoIcons.person_2_fill),
                title: Text('Aris Aditya'),
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
              child: const ListTile(
                leading: Icon(CupertinoIcons.mail_solid),
                title: Text('aris.aditya@gmail.com'),
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
              child: const ListTile(
                leading: Icon(CupertinoIcons.house_fill),
                title: Text('USIP PAMMAS'),
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
              child: const ListTile(
                leading: Icon(CupertinoIcons.phone_fill),
                title: Text('081267195871'),
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
              child: const ListTile(
                leading: Icon(CupertinoIcons.placemark_fill),
                title: Text('Banjar Kaje Kauh'),
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
