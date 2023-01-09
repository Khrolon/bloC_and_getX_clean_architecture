import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/repositories/login_repository.dart';
import 'package:poc/errors/failures.dart';

import '../../mock/mock_user_model.dart';
import 'login_repository_test.mocks.dart';

@GenerateMocks([IUserLoginDataSource])
void main() {
  late LoginRepositoryImp repository;
  late IUserLoginDataSource userLoginDataSource;

  setUp(() {
    userLoginDataSource = MockIUserLoginDataSource();
    repository = LoginRepositoryImp(userLoginDataSource);
  });

  test('Should return user model with a valid email and password', () async {
    when(userLoginDataSource.userLogin('email', 'password'))
        .thenAnswer((_) async => mockUserModel);
    final result = await repository.userLogin('email', 'password');
    expect(result, Right(mockUserModel));
    verify(userLoginDataSource.userLogin('email', 'password')).called(1);
  });

  test('Should return user failure with a error on data source', () async {
    when(userLoginDataSource.userLogin('email', 'password'))
        .thenThrow((_) async => UserFailure());
    final result = await repository.userLogin('email', 'password');
    expect(result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
    verify(userLoginDataSource.userLogin('email', 'password')).called(1);
  });
}
