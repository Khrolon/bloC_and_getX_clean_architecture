import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/data_sources/get_user_by_google_login_data_source.dart';
import 'package:poc/data/external/google_sign_in.dart';

import 'get_user_by_google_login_data_source_test.mocks.dart';

@GenerateMocks([GoogleSignInExternal])
void main() {
  late IGetUserByGoogleLoginDataSource dataSource;
  late GoogleSignInExternal googleSignInExternal;

  setUp(() {
    googleSignInExternal = MockGoogleSignInExternal();
    dataSource = GetUserByGoogleLoginDataSource(googleSignInExternal);
  });
  test('Should return success with return a user on call google sigIn',
      () async {
    //Arrange
    when(googleSignInExternal.googleSignInExternal())
        .thenAnswer((_) async => true);
    //Act
    final result = await dataSource.getUserByGoogleLogin();
    //Assert
    expect(result, true);
  });

  test('Should return success with a error on call google sigIn', () async {
    //Arrange
    when(googleSignInExternal.googleSignInExternal())
        .thenThrow((_) => Exception());
    //Act
    final result = dataSource.getUserByGoogleLogin();
    //Assert
    expect(() => result, throwsA(isA<Exception>()));
  });
}
