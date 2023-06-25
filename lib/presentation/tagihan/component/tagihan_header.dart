import 'package:flutter/material.dart';

import '../../../infrastructure/theme/app_font.dart';

class TagihanHeader extends StatelessWidget {
  const TagihanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "Tagihan Online",
            style: AppFont.title1,
          ),
        ),
      ),
    );
  }
}
