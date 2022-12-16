import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_button.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_input.dart';
import '../../widget/app_gradient_text.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Simpin',
                  style: AppFont.h1,
                ),
                const GradientText(
                  'Masuk',
                  style: TextStyle(fontSize: 65, fontWeight: FontWeight.w800),
                  gradient: LinearGradient(colors: [
                    AppColor.yellow1,
                    AppColor.green1,
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppInput(hint: "Email"),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: AppFont.title1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: !controller.isPasswordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(color: AppColor.gray2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: AppColor.gray1)),
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.remove_red_eye),
                                onPressed: controller.onShowPassword)),
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 50,
                ),
                AppButton(
                  text: "Masuk",
                  onPressed: (() {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
