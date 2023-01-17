import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/data_sources/user_google_logout_data_source.dart';
import 'package:poc/data/external/google_sign_in.dart';

import 'get_user_by_google_login_data_source_test.mocks.dart';

void main() {
  late IUserGoogleLogoutDataSource dataSource;
  late GoogleSignInExternal googleSignInExternal;

  setUp(() {
    googleSignInExternal = MockGoogleSignInExternal();
    dataSource =
        UserGoogleLogoutDataSource(googleSignInExternal: googleSignInExternal);
  });

  test('Should return success if logout works', () async {
    //Arrange
    when(googleSignInExternal.googleLogout()).thenAnswer((_) async => true);
    //Act
    final result = await dataSource.userGoogleLogout();
    //Assert
    expect(result, true);
  });

  test('Should return success if logout fails', () async {
    //Arrange
    when(googleSignInExternal.googleLogout()).thenThrow((_) async => false);
    //Act
    final result = dataSource.userGoogleLogout();
    //Assert
    expect(() => result, throwsA(isA<Exception>()));
  });
}
