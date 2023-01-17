import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:poc/infrastructure/bindings/home_controller_binding.dart';
import 'package:poc/infrastructure/bindings/login_controller_binding.dart';
import 'package:poc/infrastructure/routes/routes.dart';
import 'package:poc/presentation/home/home_scree.dart';
import 'package:poc/presentation/login/login.screen.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}
