import 'package:get/get.dart';
import 'package:poc/presentation/login/controller/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        getTokenUserLoginUseCase: Get.find(),
        userLoginUseCase: Get.find(),
        googleLoginUseCase: Get.find(),
      ),
    );
  }
}
