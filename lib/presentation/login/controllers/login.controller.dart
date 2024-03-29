import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/usecase/login_usecase.dart';

class LoginController extends GetxController {
  LoginController({required this.loginUsecase});

  final emailController = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  final AuthUsecase loginUsecase;
  final passwordController = TextEditingController();

  final _isLoading = false.obs;

  @override
  void onClose() {
    super.dispose();
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool get isLoading => _isLoading.value;

  void onShowPassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> loginUser() async {
    String fcmToken = "";
    await FirebaseMessaging.instance
        .getToken()
        .then((value) => fcmToken = value!);

    // print(fcmToken);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoading.value = true;
    final email = emailController.text;
    final password = passwordController.text;

    final result = await loginUsecase.onLoginUser(
        email: email, password: password, fcmToken: fcmToken);
    _isLoading.value = false;
    result.fold((failure) {
      // Get.defaultDialog(
      //     title: "Error",
      //     backgroundColor: AppColor.white,
      //     titleStyle: TextStyle(fontWeight: FontWeight.bold),
      //     barrierDismissible: true,
      //     radius: 15,
      //     content: Column(
      //       children: [
      //         Container(child: Text(failure.message)),
      //       ],
      //     ));
      Get.snackbar('Error', failure.message);
      print(failure.message);
    }, (success) {
      // print(success.token);
      // print(success.data.address);
      prefs.setString('token', success.token);
      prefs.setInt('user_id', success.data.id);
      prefs.setBool('isNotification', false);
      onLoginSuccess();
      Get.offNamed('/home', arguments: success);
    });
  }

  void onLoginSuccess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }
}
