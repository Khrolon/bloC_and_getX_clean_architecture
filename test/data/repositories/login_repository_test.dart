import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/repositories/login_repository.dart';
import 'package:poc/errors/failures.dart';

import '../../mock/mock_models.dart';
import 'login_repository_test.mocks.dart';

@GenerateMocks([IUserLoginDataSource, IGetUserTokenDataSource])
void main() {
  late LoginRepositoryImp repository;
  late IUserLoginDataSource userLoginDataSource;
  late IGetUserTokenDataSource getUserTokenDataSource;

  setUp(() {
    userLoginDataSource = MockIUserLoginDataSource();
    getUserTokenDataSource = MockIGetUserTokenDataSource();

    repository =
        LoginRepositoryImp(userLoginDataSource, getUserTokenDataSource);
  });

  group('GetUserLogin: ', () {
    test('Should return user model with a valid email and password', () async {
      when(userLoginDataSource.getUserLogin('email', 'password'))
          .thenAnswer((_) async => mockUserModel);
      final result = await repository.getUserLogin('email', 'password');
      expect(result, Right(mockUserModel));
      verify(userLoginDataSource.getUserLogin('email', 'password')).called(1);
    });

    test('Should return user failure with a error on data source', () async {
      when(userLoginDataSource.getUserLogin('email', 'password'))
          .thenThrow((_) async => UserFailure());
      final result = await repository.getUserLogin('email', 'password');
      expect(
          result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
      verify(userLoginDataSource.getUserLogin('email', 'password')).called(1);
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
      verify(getUserTokenDataSource.getUserToken('email', 'password')).called(1);
    });
  });
}
