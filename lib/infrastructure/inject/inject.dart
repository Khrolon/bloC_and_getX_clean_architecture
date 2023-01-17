import 'package:get_it/get_it.dart';
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
import 'package:poc/domain/usecases/user_google_logout.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/presentation/home/bloc/home_bloc.dart';
import 'package:poc/presentation/home/bloc/home_state.dart';
import 'package:poc/presentation/login/bloc/login_bloc.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //external
    getIt.registerLazySingleton<HttpClient>(() => HttpProvider());
    getIt.registerLazySingleton<GoogleSignInExternal>(() => GoogleSignInCall());

    //dataSource
    getIt.registerLazySingleton<IGetUserTokenDataSource>(
        () => GetUserTokenDataSourceImp(getIt()));
    getIt.registerLazySingleton<IUserLoginDataSource>(
        () => UserDataSourceImp(getIt()));
    getIt.registerLazySingleton<IGetUserByGoogleLoginDataSource>(
        () => GetUserByGoogleLoginDataSource(getIt()));
    getIt.registerLazySingleton<IGetUserTokenByGoogleLoginDataSource>(
        () => GetUserTokenByGoogleLoginDataSource(getIt()));
    getIt.registerLazySingleton<IUserGoogleLogoutDataSource>(
        () => UserGoogleLogoutDataSource(googleSignInExternal: getIt()));

    //repository
    getIt.registerLazySingleton<ILoginRepository>(
      () => LoginRepositoryImp(
        getUserTokenDataSource: getIt(),
        userLoginDataSource: getIt(),
        getUserByGoogleLoginDataSource: getIt(),
        getUserTokenByGoogleLoginDataSource: getIt(),
        userGoogleLogoutDataSource: getIt(),
      ),
    );

    //useCases
    getIt.registerLazySingleton<IGetTokenUserLoginUseCase>(
        () => GetTokenUserLoginUseCaseImp(repository: getIt()));
    getIt.registerLazySingleton<IUserLoginUseCase>(
        () => UserLoginUseCase(getIt()));
    getIt.registerLazySingleton<IGoogleLoginUseCase>(
        () => GoogleLoginUseCase(getIt()));
    getIt.registerLazySingleton<IUserGoogleLogoutUseCase>(
        () => UserGoogleLogoutUseCase(getIt()));

    //blocs
    getIt.registerLazySingleton<LoginBloc>(() => LoginBloc(
        userLoginUseCase: getIt(),
        getTokenUserLoginUseCase: getIt(),
        googleLoginUseCase: getIt()));
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(
        initialState: HomeState(),
        userModel: getIt.get<LoginBloc>().userModel!,
        userGoogleLogout: getIt(),
      ),
    );
  }
}
