import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/data_sources/get_user_by_google_login_data_source.dart';
import 'package:poc/data/data_sources/get_user_token_by_google_login_data_source.dart';
import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/repositories/login_repository.dart';
import 'package:poc/core/errors/failures.dart';

import '../../mock/mock_models.dart';
import 'login_repository_test.mocks.dart';

@GenerateMocks([
  IUserLoginDataSource,
  IGetUserTokenDataSource,
  IGetUserByGoogleLoginDataSource,
  IGetUserTokenByGoogleLoginDataSource,
])
void main() {
  late LoginRepositoryImp repository;
  late IUserLoginDataSource userLoginDataSource;
  late IGetUserTokenDataSource getUserTokenDataSource;
  late IGetUserByGoogleLoginDataSource getUserByGoogleLoginDataSource;
  late IGetUserTokenByGoogleLoginDataSource getUserTokenByGoogleLoginDataSource;

  setUp(() {
    userLoginDataSource = MockIUserLoginDataSource();
    getUserTokenDataSource = MockIGetUserTokenDataSource();
    getUserByGoogleLoginDataSource = MockIGetUserByGoogleLoginDataSource();
    getUserTokenByGoogleLoginDataSource =
        MockIGetUserTokenByGoogleLoginDataSource();

    repository = LoginRepositoryImp(userLoginDataSource, getUserTokenDataSource,
        getUserByGoogleLoginDataSource, getUserTokenByGoogleLoginDataSource);
  });

  group('GetUserLogin: ', () {
    test('Should return user model with a valid email and password', () async {
      when(userLoginDataSource.getUserLogin())
          .thenAnswer((_) async => mockUserModel);
      final result = await repository.getUserLogin();
      expect(result, Right(mockUserModel));
      verify(userLoginDataSource.getUserLogin()).called(1);
    });

    test('Should return user failure with a error on data source', () async {
      when(userLoginDataSource.getUserLogin())
          .thenThrow((_) async => UserFailure());
      final result = await repository.getUserLogin();
      expect(
          result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
      verify(userLoginDataSource.getUserLogin()).called(1);
    });
  });

  group('GetUserToken: ', () {
    test('Should return true with a valid user', () async {
      when(getUserTokenDataSource.getUserToken('email', 'password'))
          .thenAnswer((_) async => true);
      final result = await repository.getUserToken('email', 'password');
      expect(result, Right(true));
      verify(getUserTokenDataSource.getUserToken('email', 'password'))
          .called(1);
    });

    test('Should return failure with a error on get user token', () async {
      when(getUserTokenDataSource.getUserToken('email', 'password'))
          .thenThrow((_) async => UserFailure());
      final result = await repository.getUserToken('email', 'password');
      expect(
          result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
      verify(getUserTokenDataSource.getUserToken('email', 'password'))
          .called(1);
    });
  });

  group('GetUserByGoogleLoginDataSource: ', () {
    test('Should return true with a success google login', () async {
      when(getUserByGoogleLoginDataSource.getUserByGoogleLogin())
          .thenAnswer((_) async => true);
      final result = await repository.getUserByGoogleLogin();
      expect(result, true);
      verify(getUserByGoogleLoginDataSource.getUserByGoogleLogin()).called(1);
    });

    test('Should return failure with a error on google login', () async {
      when(getUserByGoogleLoginDataSource.getUserByGoogleLogin())
          .thenThrow((_) async => UserFailure());
      final result = await repository.getUserByGoogleLogin();
      expect(
          result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
      verify(getUserByGoogleLoginDataSource.getUserByGoogleLogin()).called(1);
    });
  });
}
