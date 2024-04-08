import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/theme/app_font.dart';
import '../../../widget/app_animated_indicator.dart';
import '../controllers/home.controller.dart';

class HomeContent extends StatefulWidget {
  final HomeController homeController;

  HomeContent({super.key, required this.homeController});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 190,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPageIndex = index;
                });
              },
            ),
            items: [
              Card(
                // margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // color: AppColor.green1,
                shadowColor: Colors.blueGrey,
                elevation: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: NetworkImage(
                              "https://cdn.discordapp.com/attachments/856786757516918784/1119157856260862042/Slice_6_1.png"))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 25, right: 25, bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Saldo Simpanan Sukarela",
                                  style: AppFont.title1,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Obx((() => IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: (() => widget.homeController
                                            .onShowSukarela()),
                                        icon: Icon(
                                          widget.homeController
                                                  .isSukarelaVisible.value
                                              ? Icons.remove_red_eye
                                              : CupertinoIcons.eye_slash_fill,
                                          color: AppColor.white,
                                          size: 20,
                                        )))))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Obx((() => Text(
                                      widget.homeController.isSukarelaVisible
                                              .value
                                          ? NumberFormat.currency(
                                                  symbol: 'Rp',
                                                  decimalDigits: 0,
                                                  locale: 'id_ID')
                                              .format(widget.homeController
                                                  .saldoBiasa.value)
                                          : "* * * * * * * * * * * *",
                                      style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                    ))),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx((() => Text(
                                  widget.homeController.simpananData.value
                                      .member!.nomorIndukAnggota,
                                  style: AppFont.subtitle1,
                                ))),
                            Obx((() => Text(
                                  widget.homeController.simpananData.value
                                      .member!.user.institutions.name,
                                  style: AppFont.subtitle1,
                                ))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                // margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // color: AppColor.green1,
                shadowColor: Colors.blueGrey,
                elevation: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: NetworkImage(
                              "https://cdn.discordapp.com/attachments/856786757516918784/1119139301842751518/Slice_4.png"))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 25, right: 25, bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Saldo Simpanan Pokok",
                                  style: AppFont.title1,
                                ),
                                SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Obx((() => IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: (() => widget.homeController
                                            .onShowPokok()),
                                        icon: Icon(
                                          widget.homeController
                                                  .isSukarelaVisible.value
                                              ? Icons.remove_red_eye
                                              : CupertinoIcons.eye_slash_fill,
                                          color: AppColor.white,
                                          size: 20,
                                        )))))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx((() => Text(
                                  widget.homeController.isPokokVisible.value
                                      ? NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(widget
                                              .homeController.saldoPokok.value)
                                      : "* * * * * * * * * * * *",
                                  style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ))),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx((() => Text(
                                  widget.homeController.simpananData.value
                                      .member!.nomorIndukAnggota,
                                  style: AppFont.subtitle1,
                                ))),
                            Obx((() => Text(
                                  widget.homeController.simpananData.value
                                      .member!.user.institutions.name,
                                  style: AppFont.subtitle1,
                                ))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                // margin: EdgeInsets.all(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // color: AppColor.green1,
                shadowColor: Colors.blueGrey,
                elevation: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: NetworkImage(
                              "https://cdn.discordapp.com/attachments/856786757516918784/1119159293472673812/Slice_5_1.png"))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 25, right: 25, bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Saldo Simpanan Wajib",
                                  style: AppFont.title1,
                                ),
                                SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Obx((() => IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: (() => widget.homeController
                                            .onShowWajib()),
                                        icon: Icon(
                                          widget.homeController
                                                  .isSukarelaVisible.value
                                              ? Icons.remove_red_eye
                                              : CupertinoIcons.eye_slash_fill,
                                          color: AppColor.white,
                                          size: 20,
                                        )))))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx((() => Text(
                                  widget.homeController.isWajibVisible.value
                                      ? NumberFormat.currency(
                                              symbol: 'Rp',
                                              decimalDigits: 0,
                                              locale: 'id_ID')
                                          .format(widget
                                              .homeController.saldoWajib.value)
                                      : "* * * * * * * * * * * *",
                                  style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ))),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx((() => Text(
                                  widget.homeController.simpananData.value
                                      .member!.nomorIndukAnggota,
                                  style: AppFont.subtitle1,
                                ))),
                            Obx((() => Text(
                                  widget.homeController.simpananData.value
                                      .member!.user.institutions.name,
                                  style: AppFont.subtitle1,
                                ))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (widget.homeController.giroInstitusi.value)
                Card(
                  // margin: EdgeInsets.all(10),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  // color: AppColor.green1,
                  shadowColor: Colors.blueGrey,
                  elevation: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: NetworkImage(
                                "https://cdn.discordapp.com/attachments/856786757516918784/1119135172785344512/Slice_3.png"))),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Saldo Giro",
                                    style: AppFont.title1,
                                  ),
                                  SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Obx((() => IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: (() => widget
                                              .homeController
                                              .onShowGiro()),
                                          icon: Icon(
                                            widget.homeController
                                                    .isSukarelaVisible.value
                                                ? Icons.remove_red_eye
                                                : CupertinoIcons.eye_slash_fill,
                                            color: AppColor.white,
                                            size: 20,
                                          )))))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx((() => Text(
                                    widget.homeController.isGiroVisible.value
                                        ? NumberFormat.currency(
                                                symbol: 'Rp',
                                                decimalDigits: 0,
                                                locale: 'id_ID')
                                            .format(widget
                                                .homeController.saldoGiro.value)
                                        : "* * * * * * * * * * * *",
                                    style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ))),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx((() => Text(
                                    widget.homeController.simpananData.value
                                        .member!.nomorIndukAnggota,
                                    style: AppFont.subtitle1,
                                  ))),
                              Obx((() => Text(
                                    widget.homeController.simpananData.value
                                        .member!.user.institutions.name,
                                    style: AppFont.subtitle1,
                                  ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedIndicator(
                isSelected: currentPageIndex == 0,
              ),
              AnimatedIndicator(
                isSelected: currentPageIndex == 1,
              ),
              AnimatedIndicator(
                isSelected: currentPageIndex == 2,
              ),
              Obx((() => widget.homeController.giroInstitusi.value
                  ? AnimatedIndicator(
                      isSelected: currentPageIndex == 3,
                    )
                  : const SizedBox()))
            ],
          ),
        )
      ],
    );
  }
}
