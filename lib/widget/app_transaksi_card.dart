import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../infrastructure/theme/app_color.dart';
import '../infrastructure/theme/app_font.dart';

class AppTransaksiCard extends StatelessWidget {
  AppTransaksiCard(
      {super.key,
      required this.title,
      required this.tanggal,
      required this.status,
      required this.jumlah,
      required this.content1,
      required this.content2,
      required this.id,
      required this.icon,
      this.onTap});

  final String title;
  final DateTime tanggal;
  final String status;
  final int jumlah;
  final String content1;
  final String content2;
  final int id;
  final Icon icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          icon,
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: AppFont.title1,
                              ),
                              Text(
                                DateFormat('dd MMMM yyyy', 'id_ID')
                                    .format(tanggal),
                                style: AppFont.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        color: status == 'pending'
                            ? AppColor.sYellow
                            : status == 'ditolak'
                                ? AppColor.sRed
                                : status == 'berjalan'
                                    ? AppColor.sBlue
                                    : AppColor.green1,
                        shadowColor: Colors.blueGrey,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 20),
                          child: Text(
                            status,
                            style: const TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: AppColor.gray5),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content1,
                        style: AppFont.title3,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        content2,
                        style: AppFont.title3,
                      ),
                    ],
                  ),
                )),
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: AppColor.gray5),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total transaksi",
                            style: AppFont.subtitle1,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            NumberFormat.currency(
                                    symbol: 'Rp',
                                    decimalDigits: 0,
                                    locale: 'id_ID')
                                .format(jumlah),
                            style: AppFont.title4,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: AppColor.white,
                          shadowColor: Colors.blueGrey,
                          elevation: 3,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 20),
                            child: Text(
                              "Detail",
                              style: TextStyle(
                                  color: AppColor.green1,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
