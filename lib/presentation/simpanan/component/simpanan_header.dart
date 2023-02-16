import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';

import '../../../infrastructure/theme/app_color.dart';

class SimpananHeader extends StatelessWidget {
  const SimpananHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "Simpanan Online",
            style: AppFont.title1,
          ),
        ),
      ),
    );
  }
}
