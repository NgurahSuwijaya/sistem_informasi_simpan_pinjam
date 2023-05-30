import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/bunga_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/kategori_pinjaman.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/tipe_jaminan.dart';
import 'package:sistem_informasi_simpan_pinjam/presentation/pengajuan/controllers/pengajuan.controller.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_input.dart';

class PengajuanContent extends StatefulWidget {
  final PengajuanController controller;
  const PengajuanContent({super.key, required this.controller});

  @override
  State<PengajuanContent> createState() => _PengajuanContentState();
}

class _PengajuanContentState extends State<PengajuanContent> {
  String? selectedItemTipeAngsuran;
  String? selectedItemJenisBunga;
  final List<String?> tipeAngsuran = ['bulanan', 'harian'];
  final List<String?> jenisBunga = ['menetap', 'menurun', 'anuitas'];
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
                    ("Form Pengajuan Pinjaman"),
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
///////////////////////////     TIPE ANGSURAN    ///////////////////////////////
                    Text(
                      "Tipe Angsuran",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2(
                      hint: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Tipe Angsuran',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor),
                          )
                        ],
                      ),
                      items: tipeAngsuran
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      item.toString(),
                                      style: AppFont.subtitle1,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: selectedItemTipeAngsuran,
                      onChanged: (value) {
                        setState(() {
                          selectedItemTipeAngsuran = value as String;
                          widget.controller.setTipeAngsuran(value);
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
                    )),
                    const SizedBox(
                      height: 20,
                    ),
///////////////////////////     KATEGORI PINJAMAN     //////////////////////////
                    Text(
                      "Kategori Pinjaman",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx((() => DropdownButtonHideUnderline(
                            child: DropdownButton2(
                          hint: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Tipe Angsuran',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor),
                              )
                            ],
                          ),
                          items: widget.controller.kategoriPinjamanList.value
                              .map((item) => DropdownMenuItem<KategoriPinjaman>(
                                    value: item,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          item!.name,
                                          style: AppFont.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          value:
                              widget.controller.selectedKategoriPinjaman.value,
                          onChanged: (KategoriPinjaman? value) {
                            widget.controller.selectedKategoriPinjaman.value =
                                value;
                          },
                          buttonHeight: 60,
                          buttonWidth: double.infinity,
                          buttonDecoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 0.7, color: AppColor.gray1),
                          ),
                          buttonElevation: 0,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          isExpanded: true,
                        )))),
                    const SizedBox(
                      height: 20,
                    ),
///////////////////////////     JENIS BUNGAAAAAA     //////////////////////////
                    Text(
                      "Jenis Bunga Pinjaman",
                      style: AppFont.title1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonHideUnderline(
                        child: DropdownButton2(
                      hint: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Jenis Bunga',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor),
                          )
                        ],
                      ),
                      items: jenisBunga
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      item.toString(),
                                      style: AppFont.subtitle1,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: selectedItemJenisBunga,
                      onChanged: (value) {
                        setState(() {
                          selectedItemJenisBunga = value as String;
                          widget.controller.setJenisBunga(value);
                          if (selectedItemJenisBunga != null &&
                              selectedItemTipeAngsuran != null) {
                            widget.controller.getBungaPinjamanData();
                          }
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
                    )),
                    const SizedBox(
                      height: 20,
                    ),
///////////////////////////     BUNGA PINJAMAN     //////////////////////////
                    Obx((() => widget
                            .controller.kategoriPinjamanHasSelected.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx((() => widget.controller.selectedJenisBunga
                                          .value ==
                                      'menurun'
                                  ? DataTable(
                                      columns: [
                                          DataColumn(
                                              label: Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Batas durasi',
                                                  style: AppFont.subtitle1,
                                                ),
                                                Text(
                                                  'pinjaman berjalan',
                                                  style: AppFont.subtitle1,
                                                ),
                                              ],
                                            ),
                                          )),
                                          DataColumn(
                                              label: Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Persentase',
                                                  style: AppFont.subtitle1,
                                                ),
                                                Text(
                                                  'Bunga',
                                                  style: AppFont.subtitle1,
                                                ),
                                              ],
                                            ),
                                          ))
                                        ],
                                      rows: widget.controller.bungaPinjamanList
                                          .map((element) => DataRow(cells: [
                                                DataCell(Text(element!
                                                    .batasDurasiPinjamanBerjalan
                                                    .toString())),
                                                DataCell(Text(element
                                                    .persentaseBunga
                                                    .toString()))
                                              ]))
                                          .toList())
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Jangka Waktu",
                                          style: AppFont.title1,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Obx((() => DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                              hint: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    'Jangka Waktu',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Theme.of(context)
                                                            .hintColor),
                                                  )
                                                ],
                                              ),
                                              items: widget.controller
                                                  .bungaPinjamanList.value
                                                  .map((item) =>
                                                      DropdownMenuItem<
                                                          BungaPinjaman>(
                                                        value: item,
                                                        child: Row(
                                                          children: [
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text(
                                                              item!.jangkaWaktu
                                                                  .toString(),
                                                              style: AppFont
                                                                  .subtitle1,
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                  .toList(),
                                              value: widget.controller
                                                  .selectedBungaPinjaman.value,
                                              onChanged:
                                                  (BungaPinjaman? value) {
                                                widget
                                                    .controller
                                                    .selectedBungaPinjaman
                                                    .value = value;
                                                print(widget
                                                    .controller
                                                    .selectedBungaPinjaman
                                                    .value
                                                    ?.jangkaWaktuInt
                                                    .toString());
                                              },
                                              buttonHeight: 60,
                                              buttonWidth: double.infinity,
                                              buttonDecoration: BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    width: 0.7,
                                                    color: AppColor.gray1),
                                              ),
                                              buttonElevation: 0,
                                              itemHeight: 40,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              isExpanded: true,
                                            )))),
                                        Obx((() => widget
                                                    .controller
                                                    .selectedBungaPinjaman
                                                    .value !=
                                                null
                                            ? Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    '  Persentase Bunga  ${widget.controller.selectedBungaPinjaman.value?.persentaseBunga} %',
                                                    style: AppFont.title42,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  )
                                                ],
                                              )
                                            : Text(''))),
                                      ],
                                    ))),
                              // Text(
                              //   "Jangka Waktu",
                              //   style: AppFont.title1,
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),

///////////////////////////     JAMINAN PINJAMAN     //////////////////////////
                              Text(
                                "Tipe Jaminan",
                                style: AppFont.title1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx((() => DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                    hint: Row(
                                      children: [
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'Tipe Jaminan',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor),
                                        )
                                      ],
                                    ),
                                    items: widget
                                        .controller.tipeJaminanList.value
                                        .map((item) =>
                                            DropdownMenuItem<TipeJaminan>(
                                              value: item,
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    item!.namaTipeJaminan,
                                                    style: AppFont.subtitle1,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                    value: widget
                                        .controller.selectedTipeJaminan.value,
                                    onChanged: (TipeJaminan? value) {
                                      widget.controller.selectedTipeJaminan
                                          .value = value;
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
                                    isExpanded: true,
                                  )))),
                              const SizedBox(
                                height: 20,
                              ),

                              AppInput(
                                  hint: 'Contoh Honda Vario 160 2019',
                                  topText: 'Nama Aset Jaminan',
                                  obscureText: false,
                                  controller: widget.controller.namaJaminan,
                                  canEdit: true,
                                  isCurrency: false),
                              const SizedBox(
                                height: 20,
                              ),
                              AppInput(
                                hint: 'Nilai Aset Jaminan',
                                topText: 'Nilai Aset Jaminan',
                                obscureText: false,
                                controller: widget.controller.nilaiAsetJaminan,
                                textInputType: TextInputType.number,
                                canEdit: true,
                                isCurrency: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppInput(
                                hint: '1000000',
                                topText: 'Nominal Pinjaman',
                                obscureText: false,
                                controller: widget.controller.jumlahPinjaman,
                                canEdit: true,
                                textInputType: TextInputType.number,
                                isCurrency: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dokumen Jaminan",
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
                                            onPressed:
                                                widget.controller.selectFile,
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColor.green1,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
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
                        : Text(''))),
                  ],
                ),
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
                    if (widget.controller.hasSelectedFile.value) {
                      // final fileName =
                      //     widget.controller.imageFile.value!.path.split('/').last;
                      final fileName = widget.controller.jaminanFile.value!.path
                          .split('/')
                          .last;
                      final filePath =
                          widget.controller.jaminanFile.value!.path;
                      print(fileName);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // "${widget.controller.jaminanFile.value!.path.split('/').last.substring(0, 20)}...",
                            fileName,
                            style: AppFont.title1,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  widget.controller
                                      .previewFile(filePath: filePath);
                                },
                                icon: const Icon(Icons.image_search),
                              ),
                              IconButton(
                                onPressed: widget.controller.deleteFile,
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
        ));
  }
}
