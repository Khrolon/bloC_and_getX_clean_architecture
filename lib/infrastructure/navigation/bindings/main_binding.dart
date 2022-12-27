import 'package:get/get.dart';
import 'package:poc/data/login/repositories/auth_login_repository_impl.dart';
import 'package:poc/domain/login/repositories/auth_login_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthLoginRepository>(() => AuthLoginRepositoryImpl(dataSource));
  }
}
