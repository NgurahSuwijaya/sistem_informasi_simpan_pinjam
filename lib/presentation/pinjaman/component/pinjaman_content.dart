import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem_informasi_simpan_pinjam/main.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_input.dart';

class PinjamanContent extends StatefulWidget {
  const PinjamanContent({super.key});

  @override
  State<PinjamanContent> createState() => _PinjamanContentState();
}

class _PinjamanContentState extends State<PinjamanContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // color: AppColor.green1,
        shadowColor: Colors.blueGrey,
        elevation: 3,
        child: Column(children: [
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
                  "Pinjaman Bunga Menetap",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Disetujui",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "1 Desember 2022",
                      style: AppFont.title2,
                    ),
                  ],
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Suku Bunga Pinjaman Perbulan",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "1 %",
                      style: AppFont.title2,
                    ),
                  ],
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lama Pinjaman",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "36 Bulan",
                      style: AppFont.title2,
                    ),
                  ],
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
                  topText: "Jumlah Simpanan",
                  hint: "Jumlah Simpanan",
                  value: "1.000.000",
                  textInputType: TextInputType.none,
                  obscureText: false,
                  canEdit: false,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jenis Jaminan",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Surat Tanah",
                      style: AppFont.title2,
                    ),
                  ],
                ),
              )),
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Jenis Jaminan",
                      style: AppFont.title1,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.cloud_download_fill,
                          color: AppColor.blackComponent,
                        ))
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
