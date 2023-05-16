import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pinjaman/controllers/pinjaman.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_input.dart';

class PinjamanFooter extends StatelessWidget {
  const PinjamanFooter({super.key, required PinjamanController controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // color: AppColor.green1,
        shadowColor: Colors.blueGrey,
        elevation: 3,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Informasi Pinjaman Aktif",
                    style: AppFont.title1,
                  ),
                )),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: AppInput(
                    topText: "Sisa Pokok Pinjaman",
                    hint: "Sisa Pokok Pinjaman",
                    value: "1.000.000",
                    textInputType: TextInputType.none,
                    obscureText: false,
                    canEdit: false,
                    isCurrency: true,
                  ),
                )),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: AppColor.gray5),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: AppInput(
                    topText: "Angsuran Yang Dibayarkan",
                    hint: "Angsuran Yang Dibayarkan",
                    value: "1.000.000",
                    textInputType: TextInputType.none,
                    obscureText: false,
                    canEdit: false,
                    isCurrency: true,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
