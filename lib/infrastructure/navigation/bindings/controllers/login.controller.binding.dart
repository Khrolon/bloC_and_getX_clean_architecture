import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:poc/data/login/external/google_login_data_source.dart';
import 'package:poc/data/login/external/user_login_data_source.dart';
import 'package:poc/data/login/repositories/login_repository_impl.dart';
import 'package:poc/domain/login/use_cases/google_sigin.dart';
import 'package:poc/domain/login/use_cases/user_login.dart';

import '../../../../presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserLoginData());
    Get.lazyPut(() => GoogleLoginData());
    Get.lazyPut(() => LoginRepositoryImpl(
          Get.find<UserLoginData>(),
          Get.find<GoogleLoginData>(),
        ));
    Get.lazyPut(() => GoogleSignImp(Get.find<LoginRepositoryImpl>()));
    Get.lazyPut(() => UserLoginImp(Get.find<LoginRepositoryImpl>()));
    Get.lazyPut<LoginController>(
      () => LoginController(
        // authLoginRepository: Get.find(),
        Get.find<GoogleSignImp>(),
        Get.find<UserLoginImp>(),
      ),
    );
  }
}
