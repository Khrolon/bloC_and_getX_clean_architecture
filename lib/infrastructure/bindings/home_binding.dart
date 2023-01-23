import 'package:get/get.dart';
import 'package:poc/domain/usecases/user_google_logout.dart';
import 'package:poc/presentation/home/controller/home_controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUserGoogleLogoutUseCase>(
        () => UserGoogleLogoutUseCase(Get.find()));
    Get.lazyPut<HomeController>(
      () => HomeController(
        userGoogleLogoutUseCase: Get.find(),
      ),
    );
  }
}
