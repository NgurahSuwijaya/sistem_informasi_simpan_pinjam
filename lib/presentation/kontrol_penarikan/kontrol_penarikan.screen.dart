import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/kontrol_penarikan.controller.dart';

class KontrolPenarikanScreen extends GetView<KontrolPenarikanController> {
  const KontrolPenarikanScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontrol Penarikan'),
        centerTitle: true,
      ),
      body: Card(
        child: CupertinoAlertDialog(
          title: Text("Kontrol penarikan"),
          content: Text(controller.content.value),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Batal'),
              onPressed: () {
                controller.onRejectPenarikan(controller.idSimpanan.value);
              },
            ),
            CupertinoDialogAction(
              onPressed: (() =>
                  controller.onAcceptPenarikan(controller.idSimpanan.value)),
              child: Text('Terima'),
            ),
          ],
        ),
      ),
      // Center(),
    );
  }
}
