import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_transaksi_card.dart';
import '../controllers/history.controller.dart';

class HistoryContent extends StatefulWidget {
  final HistoryController controller;
  const HistoryContent({super.key, required this.controller});

  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx((() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.controller.semuaTransaksiSaya.value.length,
              itemBuilder: (context, index) {
                final transaksi =
                    widget.controller.semuaTransaksiSaya.value[index];
                if (transaksi.simpananId != null) {
                  if (transaksi.tipeTransaksiId == 1) {
                    return AppTransaksiCard(
                      title: 'Simpanan',
                      tanggal: transaksi.tanggalTransaksi!,
                      status: transaksi.statusTransaksi!,
                      jumlah: transaksi.jumlah!,
                      content1: "Simpanan ${transaksi.tipeSimpanan!}",
                      content2: "Rekening ${transaksi.rekening!}",
                      id: 1,
                      icon: const Icon(
                        CupertinoIcons.book_fill,
                        color: AppColor.sPurple,
                        size: 30,
                      ),
                      onTap: (() {
                        widget.controller.goToDetailSimpanan(
                            transaksi.simpananId!, "setoran");
                      }),
                    );
                  } else if (transaksi.tipeTransaksiId == 8) {
                    return AppTransaksiCard(
                      title: 'Pemindah Bukuan',
                      tanggal: transaksi.tanggalTransaksi!,
                      status: transaksi.statusTransaksi!,
                      jumlah: transaksi.jumlah!,
                      content1: "Penerima Pemindah Bukuan",
                      content2: "Rekening ${transaksi.rekening!}",
                      id: 1,
                      icon: const Icon(
                        CupertinoIcons.book_fill,
                        color: AppColor.green1,
                        size: 30,
                      ),
                      onTap: () => widget.controller
                          .goToDetailSimpanan(transaksi.simpananId!, "setoran"),
                    );
                  } else if (transaksi.tipeTransaksiId == 7) {
                    return AppTransaksiCard(
                      title: 'Pemindah Bukuan',
                      tanggal: transaksi.tanggalTransaksi!,
                      status: transaksi.statusTransaksi!,
                      jumlah: transaksi.jumlah!,
                      content1: "Pemindah bukuan",
                      content2: "Rekening ${transaksi.rekening!}",
                      id: 1,
                      icon: const Icon(
                        CupertinoIcons.book_fill,
                        color: AppColor.sRed,
                        size: 30,
                      ),
                      onTap: () => widget.controller.goToDetailSimpanan(
                          transaksi.simpananId!, "penarikan"),
                    );
                  } else if (transaksi.tipeTransaksiId == 2) {
                    return AppTransaksiCard(
                      title: 'Penarikan',
                      tanggal: transaksi.tanggalTransaksi!,
                      status: transaksi.statusTransaksi!,
                      jumlah: transaksi.jumlah!,
                      content1: "Penarikan",
                      content2: "Rekening ${transaksi.rekening!}",
                      id: 1,
                      icon: const Icon(
                        CupertinoIcons.book_fill,
                        color: AppColor.sRed,
                        size: 30,
                      ),
                      onTap: () => widget.controller.goToDetailSimpanan(
                          transaksi.simpananId!, "penarikan"),
                    );
                  }
                }
                if (transaksi.pinjamanId != null) {
                  return AppTransaksiCard(
                    title: 'Pengajuan',
                    tanggal: transaksi.tanggalTransaksi!,
                    status: transaksi.statusTransaksi!,
                    jumlah: transaksi.jumlah!,
                    content1: "Pengajuan pinjaman",
                    content2: "Pinjaman ${transaksi.tipeBungaPinjaman}",
                    id: 1,
                    icon: const Icon(
                      CupertinoIcons.money_dollar,
                      color: AppColor.sYellow,
                      size: 30,
                    ),
                    onTap: () => widget.controller
                        .goToDetailPinjaman(transaksi.pinjamanId!, 'pinjaman'),
                  );
                }
                if (transaksi.angsuranId != null) {
                  return AppTransaksiCard(
                    title: 'Bayar Angsuran',
                    tanggal: transaksi.tanggalTransaksi!,
                    status: transaksi.statusTransaksi!,
                    jumlah: transaksi.jumlah!,
                    content1: "Angsuran pinjaman ke ${transaksi.angsuranKe}",
                    content2: "Pinjaman bunga ${transaksi.tipeBungaPinjaman}",
                    id: 1,
                    icon: const Icon(
                      CupertinoIcons.calendar_today,
                      color: AppColor.sBlue,
                      size: 30,
                    ),
                    onTap: () => widget.controller
                        .goToDetailAngsuran(transaksi.angsuranId, "angsuran"),
                  );
                }
                return const SizedBox();
              },
            ))),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
