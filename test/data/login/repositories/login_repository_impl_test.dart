import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/login/external/google_login_data_source.dart';
import 'package:poc/data/login/external/user_login_data_source.dart';
import 'package:poc/data/login/repositories/login_repository_impl.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([GoogleLoginData, UserLoginData])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockDataSource = MockUserLoginData();
  final mockGoogleLoginData = MockGoogleLoginData();
  final mockRepository = LoginRepositoryImpl(mockDataSource, GoogleLoginData());

  final dataSource = UserLoginData();
  final repository = LoginRepositoryImpl(dataSource, GoogleLoginData());

  // String validEmail = 'vitor.almeida@mitraecp.com';
  // String validPassword = 'Mitra123';

  group('Test with userLogin: ', () {
    test('Should success if enter the repository', () async {
      when(mockDataSource.login(any, any)).thenAnswer((_) async => true);
      final result = await mockRepository.userLogin('email', 'password');
      expect(result, true);
    });

    test(
        'Should success if repository return false, in test http request return 400',
        () async {
      final result = await repository.userLogin('validEmail', 'validPassword');
      expect(result, false);
    });

    // test(
    //     'Should success if repository return false with a invalid email/password',
    //     () async {
    //   final result = await repository.userLogin('email', 'password');
    //   expect(result, false);
    // });
  });

  group('Test with googleLogin: ', () {
    test('Should success if enter the repository', () async {
      when(mockGoogleLoginData.googleLogin()).thenAnswer((_) async => true);
      final result = await mockRepository.googleLogin();
      expect(result, true);
    });
  });
}
