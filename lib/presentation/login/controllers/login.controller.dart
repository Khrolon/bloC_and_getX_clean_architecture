import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;
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
