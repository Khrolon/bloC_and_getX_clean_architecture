import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // final AuthLoginRepository? authLoginRepository;
  final count = 0.obs;

  // LoginController({this.authLoginRepository});

  RxBool loading = false.obs;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  forgothPassword() {
    print("Criar senha clicado");
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
