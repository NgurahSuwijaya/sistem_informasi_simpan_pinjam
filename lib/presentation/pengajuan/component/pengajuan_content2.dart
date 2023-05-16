// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:sistem_informasi_simpan_pinjam/domain/entities/kategori_pinjaman.dart';
// import 'package:sistem_informasi_simpan_pinjam/presentation/pengajuan/controllers/pengajuan.controller.dart';

// import '../../../domain/entities/tipe_jaminan.dart';
// import '../../../infrastructure/theme/app_color.dart';
// import '../../../infrastructure/theme/app_font.dart';
// import '../../../widget/app_input.dart';
// import '../../../widget/app_pengajuan_dropdown.dart';

// class PengajuanContent2 extends StatefulWidget {
//   final PengajuanController controller;
//   const PengajuanContent2({super.key, required this.controller});

//   @override
//   State<PengajuanContent2> createState() => _PengajuanContent2State();
// }

// class _PengajuanContent2State extends State<PengajuanContent2> {
//   final List<String> jenisBunga = [
//     'menetap',
//     'menurun',
//   ];

//   final List<String> kategoriPinjaman = [
//     'produktif',
//     'konsumtif',
//   ];

//   final List<String> tipeAngsuran = [
//     'harian',
//     'bulanan',
//   ];

//   String? selectedTipeAngsuran;

//   final List<String> tipeJaminan = [
//     'Kendaraan Roda Empat',
//     'Kendaraan Roda Dua',
//     'Sertifikat Tanah',
//     'Sertifikat Bangunan',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         // color: AppColor.green1,
//         shadowColor: Colors.blueGrey,
//         elevation: 3,
//         child: Column(children: [
//           Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(width: 1.0, color: AppColor.gray5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Text(
//                   ("Form Pengajuan Pinjaman"),
//                   style: AppFont.title1,
//                 ),
//               )),
//           Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(width: 1.0, color: AppColor.gray5),
//                 ),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Tipe Angsuran",
//                       style: AppFont.title1,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     DropdownButtonHideUnderline(
//                       child: DropdownButton2(
//                         hint: Row(
//                           children: [
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             Text(
//                               'Nama Bank',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Theme.of(context).hintColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         items: tipeAngsuran
//                             .map((item) => DropdownMenuItem<String>(
//                                   value: item,
//                                   child: Row(
//                                     children: [
//                                       const SizedBox(
//                                         width: 15,
//                                       ),
//                                       Text(item, style: AppFont.subtitle1),
//                                     ],
//                                   ),
//                                 ))
//                             .toList(),
//                         value: widget.controller.tipeAngsuranTerpilih.value,
//                         onChanged: (newValue) {
//                           widget.controller.tipeAngsuranTerpilih.value =
//                               newValue.toString();
//                           widget.controller.getBungaPinjamanData();
//                         },
//                         buttonHeight: 60,
//                         buttonWidth: double.infinity,
//                         buttonDecoration: BoxDecoration(
//                           color: AppColor.white,
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(width: 0.7, color: AppColor.gray1),
//                         ),
//                         buttonElevation: 0,
//                         itemHeight: 40,
//                         itemPadding:
//                             const EdgeInsets.symmetric(horizontal: 8.0),
//                       ),
//                     ),
//                     // AppPengajuanDropDown(
//                     //   items: tipeAngsuran,
//                     //   name: 'Tipe Angsuran',
//                     //   controller: widget.controller,
//                     //   selectedValue:
//                     //       widget.controller.tipeAngsuranTerpilih.value,
//                     // ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Kategori Pinjaman",
//                       style: AppFont.title1,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Obx((() => DropdownButtonHideUnderline(
//                           child: DropdownButton2(
//                             hint: Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   'Kategori Pinjaman',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context).hintColor,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             items: widget.controller.kategoriPinjamanList.value
//                                 .map((item) =>
//                                     DropdownMenuItem<KategoriPinjaman>(
//                                       value: item,
//                                       child: Row(
//                                         children: [
//                                           const SizedBox(
//                                             width: 15,
//                                           ),
//                                           Text(item!.name,
//                                               style: AppFont.subtitle1),
//                                         ],
//                                       ),
//                                     ))
//                                 .toList(),
//                             value: widget
//                                 .controller.selectedKategoriPinjaman.value,
//                             onChanged: (KategoriPinjaman? newValue) {
//                               widget.controller.selectedKategoriPinjaman.value =
//                                   newValue;
//                               setState(() {
//                                 widget.controller.setHasKategoriPinjaman();
//                                 widget.controller.getBungaPinjamanData();
//                               });
//                             },
//                             buttonHeight: 60,
//                             buttonWidth: double.infinity,
//                             buttonDecoration: BoxDecoration(
//                               color: AppColor.white,
//                               borderRadius: BorderRadius.circular(5),
//                               border:
//                                   Border.all(width: 0.7, color: AppColor.gray1),
//                             ),
//                             buttonElevation: 0,
//                             itemHeight: 40,
//                             itemPadding:
//                                 const EdgeInsets.symmetric(horizontal: 8.0),
//                           ),
//                         ))),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Jenis Bunga",
//                       style: AppFont.title1,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     DropdownButtonHideUnderline(
//                       child: DropdownButton2(
//                         hint: Row(
//                           children: [
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             Text(
//                               'Jenis Bunga',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Theme.of(context).hintColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         items: jenisBunga
//                             .map((item) => DropdownMenuItem<String>(
//                                   value: item,
//                                   child: Row(
//                                     children: [
//                                       const SizedBox(
//                                         width: 15,
//                                       ),
//                                       Text(item, style: AppFont.subtitle1),
//                                     ],
//                                   ),
//                                 ))
//                             .toList(),
//                         value: widget.controller.selectedJenisBunga.value,
//                         onChanged: (newValue) {
//                           widget.controller.selectedJenisBunga.value =
//                               newValue.toString();

//                           widget.controller.getBungaPinjamanData();
//                         },
//                         buttonHeight: 60,
//                         buttonWidth: double.infinity,
//                         buttonDecoration: BoxDecoration(
//                           color: AppColor.white,
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(width: 0.7, color: AppColor.gray1),
//                         ),
//                         buttonElevation: 0,
//                         itemHeight: 40,
//                         itemPadding:
//                             const EdgeInsets.symmetric(horizontal: 8.0),
//                       ),
//                     ),
//                     // AppPengajuanDropDown(
//                     //     items: jenisBunga,
//                     //     name: 'Jenis Bunga',
//                     //     controller: widget.controller,
//                     //     selectedValue: widget.controller.selectedItem.value),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Obx((() => widget
//                             .controller.kategoriPinjamanHasSelected.value
//                         ? Column(children: [
//                             Text(
//                               "Jangka Waktu (Bulan)",
//                               style: AppFont.title1,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             AppPengajuanDropDown(
//                                 items: jangkaWaktu,
//                                 name: 'Jangka Waktu',
//                                 controller: widget.controller,
//                                 selectedValue:
//                                     widget.controller.selectedItem.value),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             AppInput(
//                               value: '3',
//                               hint: 'Bunga (%) Per Bulan',
//                               topText: 'Bunga (%) Perbulan',
//                               obscureText: false,
//                               canEdit: false,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               "Tipe Jaminan",
//                               style: AppFont.title1,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             DropdownButtonHideUnderline(
//                               child: DropdownButton2(
//                                 hint: Row(
//                                   children: [
//                                     const SizedBox(
//                                       width: 15,
//                                     ),
//                                     Text(
//                                       'Jenis Bunga',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Theme.of(context).hintColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 items: widget.controller.tipeJaminanList.value
//                                     .map(
//                                         (item) => DropdownMenuItem<TipeJaminan>(
//                                               value: item,
//                                               child: Row(
//                                                 children: [
//                                                   const SizedBox(
//                                                     width: 15,
//                                                   ),
//                                                   Text(item!.namaTipeJaminan,
//                                                       style: AppFont.subtitle1),
//                                                 ],
//                                               ),
//                                             ))
//                                     .toList(),
//                                 value:
//                                     widget.controller.selectedTipeJaminan.value,
//                                 onChanged: (newValue) {
//                                   widget.controller.selectedTipeJaminan.value =
//                                       newValue.toString();
//                                 },
//                                 buttonHeight: 60,
//                                 buttonWidth: double.infinity,
//                                 buttonDecoration: BoxDecoration(
//                                   color: AppColor.white,
//                                   borderRadius: BorderRadius.circular(5),
//                                   border: Border.all(
//                                       width: 0.7, color: AppColor.gray1),
//                                 ),
//                                 buttonElevation: 0,
//                                 itemHeight: 40,
//                                 itemPadding:
//                                     const EdgeInsets.symmetric(horizontal: 8.0),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             AppInput(
//                               hint: 'Contoh Honda Vario 160 2019',
//                               topText: 'Nama Aset Jaminan',
//                               obscureText: false,
//                               canEdit: true,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             AppInput(
//                               hint: '1000000',
//                               topText: 'Nilai Aset Jaminan (Rp)',
//                               obscureText: false,
//                               canEdit: true,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             AppInput(
//                               hint: '1000000',
//                               topText: 'Nominal Pinjaman (Rp)',
//                               obscureText: false,
//                               canEdit: true,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 5.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Bukti Bayar",
//                                     style: AppFont.title1,
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Bukti pembayaran berupa",
//                                             style: AppFont.subtitle3,
//                                           ),
//                                           Text(
//                                             "bukti transfer ke rekening",
//                                             style: AppFont.subtitle3,
//                                           ),
//                                           Text(
//                                             "yang tercantum",
//                                             style: AppFont.subtitle3,
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 40,
//                                         width: 100,
//                                         child: ElevatedButton(
//                                           onPressed: (() {}),
//                                           style: ElevatedButton.styleFrom(
//                                               backgroundColor: AppColor.green1,
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           5))),
//                                           child: Text(
//                                             "Pilih file",
//                                             style: AppFont.button,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ])
//                         : const Text(''))),
//                   ],
//                 ),
//               )),
//           Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(width: 1.0, color: AppColor.gray5),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 25, top: 10, right: 25, bottom: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Informasi Pinjaman Aktif",
//                       style: AppFont.title1,
//                     ),
//                     IconButton(
//                         onPressed: () {},
//                         icon: const Icon(CupertinoIcons.trash))
//                   ],
//                 ),
//               )),
//         ]),
//       ),
//     );
//   }
// }
