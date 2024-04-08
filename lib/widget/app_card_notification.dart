import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../infrastructure/theme/app_color.dart';
import '../infrastructure/theme/app_font.dart';
import 'app_shaking_text.dart';

class AppCardNotification extends StatefulWidget {
  final bool isReaded;
  final String title;
  final String subject;
  final Function()? onPressed;

  const AppCardNotification(
      {super.key,
      required this.isReaded,
      required this.title,
      required this.subject,
      this.onPressed});

  @override
  State<AppCardNotification> createState() => _AppCardNotificationState();
}

class _AppCardNotificationState extends State<AppCardNotification> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: widget.onPressed,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.title == 'Diterima'
                        ? const Icon(
                            CupertinoIcons.checkmark_alt_circle,
                            color: AppColor.green1,
                            size: 35,
                          )
                        : widget.title == "Ditolak"
                            ? const Icon(
                                CupertinoIcons.exclamationmark_triangle_fill,
                                color: AppColor.sRed,
                                size: 35,
                              )
                            : const Icon(
                                CupertinoIcons.mail_solid,
                                color: AppColor.sBlue,
                                size: 35,
                              ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: AppFont.title1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.subject,
                          style: AppFont.subtitle1,
                        ),
                      ],
                    ),
                  ],
                ),
                ShakingText(
                  text: widget.isReaded ? '' : 'BARU!',
                  style: AppFont.title4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
