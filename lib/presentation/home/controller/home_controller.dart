// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/usecases/user_google_logout.dart';

class HomeController extends GetxController {
  final IUserGoogleLogoutUseCase userGoogleLogoutUseCase;

  HomeController({required this.userGoogleLogoutUseCase});

  final UserEntity userModel = Get.arguments['userModel'];

  // final UserEntity userModel;

  // HomeController({required this.userModel});

  logout() async {
    final result = await userGoogleLogoutUseCase();
    result.fold(
      (l) => throw Exception(),
      (r) => Get.back(),
    );
  }
}
