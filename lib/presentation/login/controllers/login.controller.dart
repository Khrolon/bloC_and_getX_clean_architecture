import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc/domain/login/use_cases/forgoth_password.dart';

class LoginController extends GetxController {
  // final AuthLoginRepository? authLoginRepository;
  final count = 0.obs;

  RxBool loading = false.obs;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  forgothPassword() {
    print("Criar senha clicado");
    // forgothPasswordUseCase();
  }

  userLogin() {
    print("Login com usuario clicado");
  }

  googleLogin() {
    print("Login google clicado");
  }

  createUser() {
    print("Criar senha clicado");
  }

  // @override
  // void onInit() {
  //   count;
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   count;
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;
}
