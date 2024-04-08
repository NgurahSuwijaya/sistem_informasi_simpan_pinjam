import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/response_tagihan_simpanan.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../controllers/simpanan_wajib.controller.dart';

class SimpananWajibHeader extends StatefulWidget {
  final SimpananWajibController controller;
  final ResponseTagihanSimpanan responseTagihanSimpanan;
  const SimpananWajibHeader(
      {super.key,
      required this.controller,
      required this.responseTagihanSimpanan});

  @override
  State<SimpananWajibHeader> createState() => _SimpananWajibHeaderState();
}

class _SimpananWajibHeaderState extends State<SimpananWajibHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Bayar Simpanan Wajib",
                style: AppFont.title1,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
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
                      "Informasi Tagihan Simpanan",
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tanggal Jatuh Tempo",
                          style: AppFont.title3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(widget
                                  .responseTagihanSimpanan.data[0].jatuhTempo)
                              .toString(),
                          style: AppFont.title4,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Tagihan Simpanan Wajib",
                          style: AppFont.title1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'Rp',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(
                                  widget.responseTagihanSimpanan.totalTagihan)
                              .toString(),
                          style: AppFont.title42,
                        ),
                      ],
                    ),
                  )),
            ]),
          ),
        ),
      ],
    );
  }
}
