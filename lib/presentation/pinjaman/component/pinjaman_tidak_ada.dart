import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';

import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_button.dart';
import '../controllers/pinjaman.controller.dart';

class PinjamanTidakAda extends StatelessWidget {
  const PinjamanTidakAda({super.key, required PinjamanController controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Informasi Pinjaman",
                style: AppFont.title1,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Saat ini anda",
                        style: AppFont.title1,
                      ),
                      Text(
                        "tidak mempunyai",
                        style: AppFont.title41,
                      ),
                    ],
                  ),
                  Text(
                    "pinjaman aktif apapun",
                    style: AppFont.title1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Apakah anda ingin melakukan",
                    style: AppFont.title1,
                  ),
                  Text(
                    "pengajuan pinjaman?",
                    style: AppFont.title4,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              AppButton(
                text: "Halaman pengajuan pinjaman",
                onPressed: () {
                  Get.toNamed('/pengajuan');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AppButton(
                color: AppColor.sRed,
                text: "Kembali",
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
