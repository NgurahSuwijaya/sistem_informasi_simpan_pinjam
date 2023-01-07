import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/notification.controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NotificationScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
