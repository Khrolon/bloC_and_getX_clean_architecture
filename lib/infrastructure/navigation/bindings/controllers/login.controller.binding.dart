import 'package:get/get.dart';
import 'package:poc/domain/login/use_cases/forgoth_password.dart';

import '../../../../presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => null);
    Get.lazyPut<LoginController>(
      () => LoginController(
          // authLoginRepository: Get.find(),
          ),
    );
  }
}
