import 'package:get_it/get_it.dart';
import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/http_client/http_client.dart';
import 'package:poc/data/repositories/login_repository.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/presentation/home/bloc/home_bloc.dart';
import 'package:poc/presentation/home/bloc/home_state.dart';
import 'package:poc/presentation/login/bloc/login_bloc.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //http
    getIt.registerLazySingleton<HttpClient>(() => HttpProvider());

    //dataSource
    getIt.registerLazySingleton<IGetUserTokenDataSource>(
        () => GetUserTokenDataSourceImp(getIt()));
    getIt.registerLazySingleton<IUserLoginDataSource>(
        () => UserDataSourceImp(getIt()));

    //repository
    getIt.registerLazySingleton<ILoginRepository>(
        () => LoginRepositoryImp(getIt(), getIt()));

    //useCases
    getIt.registerLazySingleton<IGetTokenUserLoginUseCase>(
        () => GetTokenUserLoginUseCaseImp(repository: getIt()));
    getIt.registerLazySingleton<IUserLoginUseCase>(
        () => UserLoginUseCase(getIt()));

    //blocs
    getIt.registerLazySingleton<LoginBloc>(() => LoginBloc(
        userLoginUseCase: getIt(), getTokenUserLoginUseCase: getIt()));
    getIt.registerLazySingleton<HomeBloc>(
      () => HomeBloc(
        initialState: HomeState(),
        userModel: getIt.get<LoginBloc>().userModel,
      ),
    );
  }
}
