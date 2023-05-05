import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_pengajuan_dropdown.dart';

import '../../../widget/app_input.dart';
import '../../../widget/app_simpanan_dropdown.dart';

class SimpananContent extends StatefulWidget {
  const SimpananContent({super.key});

  @override
  State<SimpananContent> createState() => _SimpananContentState();
}

class _SimpananContentState extends State<SimpananContent> {
  final List<String> jenisSimpanan = [
    'Simpanan Wajib',
    'Simpanan Pribadi',
  ];

  final List<String> bankTujuan = [
    'BCA',
    'BRI',
    'MANDIRI',
    'BPD BALI',
  ];
  String? selectedValue;

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppInput(
                  topText: "Tanggal Simpanan",
                  hint: "Tanggal Sekarang",
                  canEdit: true,
                  obscureText: false,
                  textInputType: TextInputType.datetime,
                  prefixIcons: Icon(CupertinoIcons.calendar_today),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Jenis Simpanan",
                  style: AppFont.title1,
                ),
                SizedBox(
                  height: 3,
                ),
                AppSimpananDropDown(
                  items: jenisSimpanan,
                  name: 'Jenis Simpanan',
                ),
                SizedBox(
                  height: 20,
                ),
                AppInput(
                  topText: "Jumlah Simpanan",
                  hint: "Jumlah Simpanan",
                  canEdit: true,
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bank Tujuan",
                  style: AppFont.title1,
                ),
                SizedBox(
                  height: 3,
                ),
                AppSimpananDropDown(
                  items: bankTujuan,
                  name: 'Bank Tujuan',
                ),
                SizedBox(
                  height: 20,
                ),
                AppInput(
                  topText: "No Rekening Koperasi",
                  hint: "7720828094 A/N Ketut Nyamprut",
                  obscureText: false,
                  canEdit: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bukti Bayar",
                      style: AppFont.title1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bukti pembayaran berupa",
                              style: AppFont.subtitle3,
                            ),
                            Text(
                              "bukti transfer ke rekening",
                              style: AppFont.subtitle3,
                            ),
                            Text(
                              "yang tercantum",
                              style: AppFont.subtitle3,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: (() {}),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.green1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: Text(
                              "Pilih file",
                              style: AppFont.button,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: AppColor.gray1),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        "buktitf.jpg",
                        style: AppFont.title1,
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(CupertinoIcons.trash))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
