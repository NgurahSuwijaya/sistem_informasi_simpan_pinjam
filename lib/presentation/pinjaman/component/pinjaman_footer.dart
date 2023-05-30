import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pinjaman/controllers/pinjaman.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_input.dart';

class PinjamanFooter extends StatefulWidget {
  PinjamanController controller;
  PinjamanFooter({super.key, required this.controller});

  @override
  State<PinjamanFooter> createState() => _PinjamanFooterState();
}

class _PinjamanFooterState extends State<PinjamanFooter> {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Obx((() => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sisa Pokok Pinjaman",
                              style: AppFont.title1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColor.gray5),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(
                                              widget.controller.sisaPokok.value)
                                          .toString(),
                                      style: AppFont.title2),
                                ),
                              ),
                            ),
                          ],
                        ))))),
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
                    child: Obx((() => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sisa Bunga Pinjaman",
                              style: AppFont.title1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColor.gray5),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                      NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(
                                              widget.controller.sisaBunga.value)
                                          .toString(),
                                      style: AppFont.title2),
                                ),
                              ),
                            ),
                          ],
                        ))))),
          ],
        ),
      ),
    );
  }
}
