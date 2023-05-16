import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/simpanan/controllers/simpanan.controller.dart';

import '../../../domain/entities/response_bank.dart';
import '../../../widget/app_input.dart';

class SimpananContent extends StatefulWidget {
  final SimpananController controller;
  const SimpananContent({super.key, required this.controller});

  @override
  State<SimpananContent> createState() => _SimpananContentState();
}

class _SimpananContentState extends State<SimpananContent> {
  String? selectedValueJenis;
  String? selectedValueRekening;
  String? selectedValueTipeTransaksi;
  String formattedDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal());
  final List<String> jenisValRekening = ['biasa', 'giro'];
  final List<String> tipeTransaksi = ['setoran', 'penarikan'];
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
                  topText: "Tanggal Transaksi",
                  hint: "Tanggal Sekarang",
                  canEdit: false,
                  obscureText: false,
                  value: formattedDate,
                  textInputType: TextInputType.datetime,
                  prefixIcons: const Icon(CupertinoIcons.calendar_today),
                  isCurrency: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Tipe Transaksi Simpanan",
                  style: AppFont.title1,
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Tipe Transaksi',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                    items: tipeTransaksi
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(item.toString(),
                                      style: AppFont.subtitle1),
                                ],
                              ),
                            ))
                        .toList(),
                    value: selectedValueTipeTransaksi,
                    onChanged: (value) {
                      setState(() {
                        selectedValueTipeTransaksi = value.toString();
                        widget.controller.setJenisRekening(
                            selectedValueTipeTransaksi.toString());
                        widget.controller.setPenarikan(value.toString());
                      });
                    },
                    buttonHeight: 60,
                    buttonWidth: double.infinity,
                    buttonDecoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.7, color: AppColor.gray1),
                    ),
                    buttonElevation: 0,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
                // Obx((() => DropdownButtonHideUnderline(
                //       child: DropdownButton2(
                //         hint: Row(
                //           children: [
                //             const SizedBox(
                //               width: 15,
                //             ),
                //             Text(
                //               'Tipe Simpanan',
                //               style: TextStyle(
                //                 fontSize: 14,
                //                 color: Theme.of(context).hintColor,
                //               ),
                //             ),
                //           ],
                //         ),
                //         items: widget.controller.tipeSimpananList.value
                //             .map((item) => DropdownMenuItem<TipeSimpanans>(
                //                   value: item,
                //                   child: Row(
                //                     children: [
                //                       const SizedBox(
                //                         width: 15,
                //                       ),
                //                       Text(item.name, style: AppFont.subtitle1),
                //                     ],
                //                   ),
                //                 ))
                //             .toList(),
                //         value: widget.controller.chosedTipeSimpanan.value,
                //         onChanged: (TipeSimpanans? newValue) {
                //           widget.controller.chosedTipeSimpanan.value = newValue;
                //         },
                //         buttonHeight: 60,
                //         buttonWidth: double.infinity,
                //         buttonDecoration: BoxDecoration(
                //           color: AppColor.white,
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(width: 0.7, color: AppColor.gray1),
                //         ),
                //         buttonElevation: 0,
                //         itemHeight: 40,
                //         itemPadding:
                //             const EdgeInsets.symmetric(horizontal: 8.0),
                //       ),
                //     ))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Rekening Simpanan",
                  style: AppFont.title1,
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Jenis Rekening',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                    items: jenisValRekening
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(item.toString(),
                                      style: AppFont.subtitle1),
                                ],
                              ),
                            ))
                        .toList(),
                    value: selectedValueRekening,
                    onChanged: (value) {
                      setState(() {
                        selectedValueRekening = value.toString();
                        widget.controller
                            .setJenisRekening(selectedValueRekening.toString());
                      });
                    },
                    buttonHeight: 60,
                    buttonWidth: double.infinity,
                    buttonDecoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.7, color: AppColor.gray1),
                    ),
                    buttonElevation: 0,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                AppInput(
                  controller: widget.controller.jumlahSimpananController,
                  topText: "Jumlah",
                  hint: "Jumlah",
                  canEdit: true,
                  obscureText: false,
                  textInputType: TextInputType.number,
                  isCurrency: true,
                ),

                Obx((() => widget.controller.isSetoran.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Bank Koperasi",
                            style: AppFont.title1,
                          ),
                          const SizedBox(
                            height: 8,
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
                                    widget.controller.chosedBank.value =
                                        newValue;
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
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ))),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx((() => Text(
                                widget.controller.rekening.value,
                                style: AppFont.title42,
                              ))),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: widget.controller.selectImage,
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.green1,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
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
                      )
                    : const Text(""))),
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
        ],
      ),
    );
  }
}
