import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/response_bank.dart';
import '../../../domain/entities/response_tagihan_simpanan.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_input.dart';
import '../controllers/simpanan_wajib.controller.dart';

class SimpananWajibContent extends StatefulWidget {
  final SimpananWajibController controller;
  final ResponseTagihanSimpanan responseTagihanSimpanan;
  const SimpananWajibContent(
      {super.key,
      required this.controller,
      required this.responseTagihanSimpanan});

  @override
  State<SimpananWajibContent> createState() => _SimpananWajibContentState();
}

class _SimpananWajibContentState extends State<SimpananWajibContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      "Form Pembayaran Angsuran",
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
                        AppInput(
                          value: DateFormat('dd MMMM yyyy')
                              .format(DateTime.now())
                              .toString(),
                          hint: 'Tanggal Pembayaran',
                          topText: 'Tanggal Pembayaran',
                          obscureText: false,
                          canEdit: false,
                          isCurrency: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppInput(
                          hint: NumberFormat.currency(
                                  symbol: 'Rp',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(
                                  widget.responseTagihanSimpanan.totalTagihan)
                              .toString(),
                          topText: 'Jumlah yang dibayarkan',
                          obscureText: false,
                          controller: widget.controller.jumlahBayarController,
                          canEdit: true,
                          isCurrency: true,
                          textInputType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Bank Jaminan",
                          style: AppFont.title1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Obx((() => DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Nama Bank',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                  ],
                                ),
                                items: widget.controller.bankList.value
                                    .map((item) => DropdownMenuItem<Bank>(
                                          value: item,
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(item.namaBank,
                                                  style: AppFont.subtitle1),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                                value: widget.controller.chosedBank.value,
                                onChanged: (Bank? newValue) {
                                  widget.controller.chosedBank.value = newValue;
                                  if (newValue != null) {
                                    widget.controller.setNomrek(
                                        newValue.nomorRekening,
                                        newValue.atasNama);
                                  }
                                },
                                buttonHeight: 60,
                                buttonWidth: double.infinity,
                                buttonDecoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.7, color: AppColor.gray1),
                                ),
                                buttonElevation: 0,
                                itemHeight: 40,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                            ))),
                        Obx((() => widget.controller.isBankHasSelected.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Nomor Rekening",
                                    style: AppFont.title1,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: AppColor.gray5),
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Text(
                                                widget.controller.chosedBank
                                                    .value!.nomorRekening
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.blackComponent,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: AppColor.gray5),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                text: widget
                                                    .controller
                                                    .chosedBank
                                                    .value!
                                                    .nomorRekening
                                                    .toString(),
                                              ),
                                            ).then((value) {});
                                          },
                                          icon: Icon(Icons.copy),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Atas Nama",
                                    style: AppFont.title1,
                                  ),
                                  SizedBox(
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
                                          widget.controller.chosedBank.value!
                                              .atasNama
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColor.blackComponent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bukti Bayar",
                                          style: AppFont.title1,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                            //
                                            SizedBox(
                                              height: 40,
                                              width: 100,
                                              child: ElevatedButton(
                                                onPressed: widget
                                                    .controller.selectImage,
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColor.green1,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5))),
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
                                  ),
                                ],
                              )
                            : SizedBox())),
                      ],
                    ),
                  )),
              Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: AppColor.gray1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Obx(() {
                      if (widget.controller.hasSelectedImage.value) {
                        // final fileName =
                        //     widget.controller.imageFile.value!.path.split('/').last;
                        print(widget.controller.imageFile.value!.path
                            .split('/')
                            .last);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.controller.imageFile.value!.path.split('/').last.substring(0, 20)}...",
                              style: AppFont.title1,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: widget.controller.previewImage,
                                  icon: const Icon(Icons.image_search),
                                ),
                                IconButton(
                                  onPressed: widget.controller.deleteImage,
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }),
                  )),
            ]),
          ),
        ),
      ],
    );
  }
}
