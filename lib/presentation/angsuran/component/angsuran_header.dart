import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/response_tagihan_angsuran.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/angsuran/controllers/angsuran.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';

class AngsuranHeader extends StatefulWidget {
  final AngsuranController controller;
  final ResponseTagihanAngsuran responseTagihanAngsuran;

  const AngsuranHeader(
      {super.key,
      required this.controller,
      required this.responseTagihanAngsuran});

  @override
  State<AngsuranHeader> createState() => _AngsuranHeaderState();
}

class _AngsuranHeaderState extends State<AngsuranHeader> {
  @override
  Widget build(BuildContext context) {
    print(widget.responseTagihanAngsuran);
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
                "Tagihan Angsuran",
                style: AppFont.title1,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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
                      "Informasi Pinjaman",
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
                          "Jenis Pinjaman",
                          style: AppFont.title3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pinjaman Bunga ${widget.responseTagihanAngsuran.tagihanAngsuran![0].pinjaman.tipeBungaPinjaman[0].toUpperCase()}${widget.responseTagihanAngsuran.tagihanAngsuran![0].pinjaman.tipeBungaPinjaman.substring(1)}",
                          style: AppFont.title42,
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
                          "Tanggal Jatuh Tempo",
                          style: AppFont.title3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(widget.responseTagihanAngsuran
                                  .tagihanAngsuran![0].jatuhTempo)
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
                          "Angsuran Ke-",
                          style: AppFont.title3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ke ${widget.responseTagihanAngsuran.tagihanAngsuran![0].angsuranKe}",
                          style: AppFont.title4,
                        ),
                      ],
                    ),
                  )),
              widget.responseTagihanAngsuran.tagihanAngsuran![0].pinjaman
                          .tipeBungaPinjaman ==
                      'menurun'
                  ? SizedBox()
                  : Container(
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
                              "Tagihan Angsuran Pokok",
                              style: AppFont.title3,
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
                                      widget.responseTagihanAngsuran.totalPokok)
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
                          "Tagihan Angsuran Bunga",
                          style: AppFont.title3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'Rp',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(widget.responseTagihanAngsuran.totalBunga)
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
                          "Biaya Admin",
                          style: AppFont.title3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'Rp',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(widget.responseTagihanAngsuran.totalAdmin)
                              .toString(),
                          style: AppFont.title43,
                        ),
                      ],
                    ),
                  )),
              widget.responseTagihanAngsuran.tagihanAngsuran![0].pinjaman
                          .tipeBungaPinjaman ==
                      'menurun'
                  ? SizedBox()
                  : Container(
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
                              "Pinalti",
                              style: AppFont.title3,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              NumberFormat.currency(
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                      locale: 'id_ID')
                                  .format(widget
                                      .responseTagihanAngsuran.totalPenalti)
                                  .toString(),
                              style: AppFont.title41,
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
                          "Total Tagihan Angsuran",
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
                                  widget.responseTagihanAngsuran.totalTagihan)
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
