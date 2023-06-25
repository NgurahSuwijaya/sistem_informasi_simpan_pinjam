import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_color.dart';
import 'package:sistem_informasi_simpan_pinjam/infrastructure/theme/app_font.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_input.dart';
import '../../widget/app_gradient_text.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masuk',
                        style: AppFont.h1,
                      ),
                      const GradientText(
                        'Simpin',
                        style: TextStyle(
                            fontSize: 65, fontWeight: FontWeight.w800),
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
                      AppInput(
                        hint: "Email",
                        canEdit: true,
                        topText: "Email",
                        obscureText: false,
                        controller: controller.emailController,
                        isCurrency: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => controller.isPasswordVisible.value
                            ? AppInput(
                                topText: "Password",
                                // value: controller.passwordController.text,
                                canEdit: true,
                                hint: "Password",

                                controller: controller.passwordController,
                                obscureText:
                                    !controller.isPasswordVisible.value,
                                sufixIcons: IconButton(
                                  icon:
                                      const Icon(CupertinoIcons.eye_slash_fill),
                                  onPressed: controller.onShowPassword,
                                ),
                                isCurrency: false,
                              )
                            : AppInput(
                                topText: "Password",
                                // value: controller.passwordController.text.isNotEmpty,
                                canEdit: true,
                                hint: "Password",
                                controller: controller.passwordController,
                                obscureText:
                                    !controller.isPasswordVisible.value,
                                sufixIcons: IconButton(
                                  icon: const Icon(CupertinoIcons.eye_fill),
                                  onPressed: controller.onShowPassword,
                                ),
                                isCurrency: false,
                              ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // AppButton(
                      //   text: "Masuk",
                      //   onPressed: (() {
                      //     // controller.loginUser();
                      //   }),
                      // )
                      SizedBox(
                        height: 50,
                        width: 500,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // backgroundColor: color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            if (controller.emailController.text.isNotEmpty &&
                                controller.passwordController.text.isNotEmpty) {
                              controller.loginUser();
                            } else {
                              Get.snackbar(
                                  'Error', 'Email atau Password Kosong');
                            }
                          },
                          child: Text(
                            'Masuk',
                            style: AppFont.button,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
    );
  }
}
