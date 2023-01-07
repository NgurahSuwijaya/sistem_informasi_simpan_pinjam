import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
