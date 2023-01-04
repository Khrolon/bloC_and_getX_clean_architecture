import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/domain/login/repositories/login_repository.dart';
import 'package:poc/domain/login/use_cases/user_login.dart';

@GenerateMocks([LoginRepository])
void main() {
  // final repository = MockUserLoginRepository();
  // final useCase = UserLoginImp(repository);
  // var validEmail = 'vitor';

  test('Should sucess if email and password is valid', () async {
    // when(repository.userLogin(any, any)).thenAnswer((_) async => true);
    // final result = await useCase('vitor', 'v');
    // expect(result, isTrue);
  });

  test('Should sucess if email and password is invalid', () {});
}
