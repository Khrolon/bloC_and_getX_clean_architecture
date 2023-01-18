// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/google_login_use_case.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/infrastructure/routes/routes.dart';

class LoginController extends GetxController {
  final IGetTokenUserLoginUseCase getTokenUserLoginUseCase;
  final IUserLoginUseCase userLoginUseCase;
  final IGoogleLoginUseCase googleLoginUseCase;

  LoginController({
    required this.getTokenUserLoginUseCase,
    required this.userLoginUseCase,
    required this.googleLoginUseCase,
  });

  RxBool showPassword = false.obs;

  late UserEntity userModel;

  RxBool loading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  forgothPassword() {
    print("Criar senha clicado");
    // forgothPasswordUseCase();
  }

  userLogin() async {
    loading.value = true;
    final result = await getTokenUserLoginUseCase.call(
        emailController.text, passwordController.text);

    result.fold(
      (l) => throw Exception(),
      (r) async => await _getUserLoginData(),
    );
  }

  _getUserLoginData() async {
    final result = await userLoginUseCase();
    result.fold(
      (l) => throw Exception(),
      (r) async {
        userModel = r;
        Get.toNamed(AppRoutes.home, arguments: {'userModel': userModel});
        loading.value = false;
      },
    );
  }

  googleLogin() async {
    loading.value = true;
    final result = await googleLoginUseCase();

    result.fold(
      (l) => null,
      (r) async => await _getUserLoginData(),
    );
    loading.value = false;
  }

  createUser() {
    print("Criar senha clicado");
  }

  void togglevisibility() {
    showPassword.value = !showPassword.value;
  }
}
