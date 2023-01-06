import 'package:get/get.dart';
import 'package:poc/domain/login/repositories/login_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthLoginRepository>(() => AuthLoginRepositoryImpl(dataSource));
  }
}
