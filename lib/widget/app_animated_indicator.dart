import 'package:flutter/material.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';

class AnimatedIndicator extends StatelessWidget {
  final bool isSelected;

  const AnimatedIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isSelected ? 36.0 : 8.0,
      height: 6.0,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4.0),
        color: AppColor.gray1,
      ),
    );
  }
}
