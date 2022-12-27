import 'package:get/get.dart';
import 'package:poc/domain/login/repositories/auth_login_repository.dart';

class LoginController extends GetxController {
  final AuthLoginRepository? authLoginRepository;
  final count = 0.obs;

  LoginController({this.authLoginRepository});

  @override
  void onInit() {
    count;
    super.onInit();
  }

  @override
  void onReady() {
    count;
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
