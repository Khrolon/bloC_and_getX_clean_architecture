import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc/domain/login/use_cases/forgoth_password.dart';
import 'package:poc/domain/login/use_cases/google_sigin.dart';
import 'package:poc/domain/login/use_cases/user_login.dart';

class LoginController extends GetxController {
  // final AuthLoginRepository? authLoginRepository;

  LoginController(this._googleSign, this._userLogin);

  final UserLogin _userLogin;
  final GoogleSign _googleSign;

  final count = 0.obs;

  RxBool loading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  forgothPassword() {
    print("Criar senha clicado");
    // forgothPasswordUseCase();
  }

  userLogin() {
    print("Login com usuario clicado");
    _userLogin(emailController.text, passwordController.text);
  }

  googleLogin() {
    print("Login google clicado");
    _googleSign();
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
