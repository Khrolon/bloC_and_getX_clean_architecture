import 'package:get/get.dart';
import 'package:poc/data/data_sources/get_user_by_google_login_data_source.dart';
import 'package:poc/data/data_sources/get_user_token_by_google_login_data_source.dart';
import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/data_sources/user_google_logout_data_source.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/external/google_sign_in.dart';
import 'package:poc/data/external/http_client.dart';
import 'package:poc/data/repositories/login_repository.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/google_login_use_case.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    //External
    Get.lazyPut<HttpClient>(() => HttpProvider());
    Get.lazyPut<GoogleSignInExternal>(() => GoogleSignInCall());

    //dataSources
    Get.lazyPut<IGetUserByGoogleLoginDataSource>(
        () => GetUserByGoogleLoginDataSource(Get.find()));
    Get.lazyPut<IGetUserTokenByGoogleLoginDataSource>(
        () => GetUserTokenByGoogleLoginDataSource(Get.find()));
    Get.lazyPut<IGetUserTokenDataSource>(
        () => GetUserTokenDataSourceImp(Get.find()));
    Get.lazyPut<IUserGoogleLogoutDataSource>(
        () => UserGoogleLogoutDataSource(googleSignInExternal: Get.find()));
    Get.lazyPut<IUserLoginDataSource>(() => UserDataSourceImp(Get.find()));

    //Repositories
    Get.lazyPut<ILoginRepository>(
      () => LoginRepositoryImp(
        getUserByGoogleLoginDataSource: Get.find(),
        getUserTokenByGoogleLoginDataSource: Get.find(),
        getUserTokenDataSource: Get.find(),
        userGoogleLogoutDataSource: Get.find(),
        userLoginDataSource: Get.find(),
      ),
    );

    //UseCases
    Get.lazyPut<IGetTokenUserLoginUseCase>(
        () => GetTokenUserLoginUseCaseImp(repository: Get.find()));
    Get.lazyPut<IGoogleLoginUseCase>(() => GoogleLoginUseCase(Get.find()));
    Get.lazyPut<IUserLoginUseCase>(() => UserLoginUseCase(Get.find()));
  }
}
