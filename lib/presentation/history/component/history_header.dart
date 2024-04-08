import 'package:flutter/material.dart';
import '../../../infrastructure/theme/app_color.dart';
import '../../../widget/app_button.dart';
import '../controllers/history.controller.dart';

class HistoryHeader extends StatefulWidget {
  final HistoryController controller;
  const HistoryHeader({super.key, required this.controller});

  @override
  State<HistoryHeader> createState() => _HistoryHeaderState();
}

class _HistoryHeaderState extends State<HistoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  text: "Berlangsung",
                  color: AppColor.green1,
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: AppButton(
                  text: "Selesai",
                  color: AppColor.green1,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
