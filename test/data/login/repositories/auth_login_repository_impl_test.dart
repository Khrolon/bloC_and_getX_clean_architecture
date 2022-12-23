import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/login/datasources/auth_login_data_source.dart';
import 'package:poc/data/login/models/user_model.dart';
import 'package:poc/data/login/repositories/auth_login_repository_impl.dart';

import 'auth_login_repository_impl_test.mocks.dart';

@GenerateMocks([AuthLoginDataSource])
void main() {
  final dataSource = MockAuthLoginDataSource();
  final repository = AuthLoginRepositoryImpl(dataSource);
  test('Should success if create userModel', () async {
    when(dataSource.getUser(any, any))
        .thenAnswer((_) async => UserModel(0, 'name', 'email', true));
    final result = repository.dataSource.getUser('email', 'password');

    expect(result, isA<Future<UserModel>>());
  });
}
