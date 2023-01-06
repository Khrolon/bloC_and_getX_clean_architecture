import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/domain/login/repositories/login_repository.dart';
import 'package:poc/domain/login/use_cases/user_login.dart';

import 'user_login_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  final repository = MockLoginRepository();
  final useCase = UserLoginImp(repository);

  test('Should sucess if useCase reach repository', () async {
    when(repository.userLogin(any, any)).thenAnswer((_) async => true);
    final result = await useCase('vitor', 'v');
    expect(result, isTrue);
  });
}
