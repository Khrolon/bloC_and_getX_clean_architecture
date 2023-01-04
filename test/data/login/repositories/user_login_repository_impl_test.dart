import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/login/datasources/user_login_data_source.dart';
import 'package:poc/data/login/models/user_model.dart';

import 'user_login_repository_impl_test.mocks.dart';

@GenerateMocks([UserLoginDataSource])
void main() {
  final dataSource = MockUserLoginDataSource();
  // final repository = AuthLoginRepositoryImpl(dataSource);
  test('Should success if create userModel', () async {
    when(dataSource.login(any, any)).thenAnswer((_) async =>
        UserModel(id: 0, name: 'name', email: 'email', isDev: true));
    // final result = repository.dataSource.login('email', 'password');

    // expect(result, isA<Future<UserModel>>());
  });
}
