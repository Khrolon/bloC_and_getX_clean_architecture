import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/http_client/http_client.dart';
import 'package:poc/data/repositories/login_repository.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/infrastructure/inject/inject.dart';
import 'package:poc/presentation/login/bloc/login_bloc.dart';

void main() {
  Inject.init();
  test(
      'Should return success with a correct dependenci injection of HttpClient',
      () async {
    //Arrange
    //Act
    var injection = GetIt.I.get<HttpClient>();
    //Asssert
    expect(injection, isA<HttpProvider>());
  });

  test(
      'Should return success with a correct dependenci injection of GetUserTokenDataSource',
      () async {
    //Arrange
    //Act
    var injection = GetIt.I.get<IGetUserTokenDataSource>();
    //Asssert
    expect(injection, isA<GetUserTokenDataSourceImp>());
  });

  test(
      'Should return success with a correct dependenci injection of UserLoginDataSource',
      () async {
    //Arrange
    //Act
    var injection = GetIt.I.get<IUserLoginDataSource>();
    //Asssert
    expect(injection, isA<UserDataSourceImp>());
  });

  test(
      'Should return success with a correct dependenci injection of LoginRepository',
      () async {
    //Arrange
    //Act
    var injection = GetIt.I.get<ILoginRepository>();
    //Asssert
    expect(injection, isA<LoginRepositoryImp>());
  });

  test(
      'Should return success with a correct dependenci injection of GetTokenUserLoginUseCase',
      () async {
    //Arrange
    //Act
    var injection = GetIt.I.get<IGetTokenUserLoginUseCase>();
    //Asssert
    expect(injection, isA<GetTokenUserLoginUseCaseImp>());
  });

  test(
      'Should return success with a correct dependenci injection of UserLoginUseCase',
      () async {
    //Arrange
    //Act
    var injection = GetIt.I.get<IUserLoginUseCase>();
    //Asssert
    expect(injection, isA<UserLoginUseCase>());
  });

  test(
      'Should return success with a correct dependenci injection of LoginController',
      () async {
    //Arrange
    //Act
    var injection = GetIt.I.get<LoginBloc>();
    //Asssert
    expect(injection, isA<LoginBloc>());
  });
}
