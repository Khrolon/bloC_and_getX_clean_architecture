import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/domain/login/repositories/auth_login_repository.dart';
import 'package:poc/domain/login/use_cases/auth_login.dart';

import 'auth_login_test.mocks.dart';

@GenerateMocks([AuthLoginRepository])
void main() {
  final repository = MockAuthLoginRepository();
  final useCase = AuthLoginImp(repository);

  test('Should sucess if email and password is valid', () async {
    when(repository.authLogin('vitor', 'v')).thenAnswer((_) async => true);
    final result = await useCase('vitor', 'v');
    expect(result, isTrue);
  });

  test('Should sucess if email and password is invalid', () {});
}
