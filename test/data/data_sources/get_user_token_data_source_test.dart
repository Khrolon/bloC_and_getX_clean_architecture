import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/external/http_client.dart';
import 'package:poc/core/errors/failures.dart';

import '../../mock/mock_models.dart';
import 'user_login_data_source_test.mocks.dart';

void main() {
  late IGetUserTokenDataSource userDataSource;
  late MockHttpClient client;

  setUp(() {
    client = MockHttpClient();
    userDataSource = GetUserTokenDataSourceImp(client);
  });

  test('Should return success with call http post with correct url', () async {
    //Arrange
    when(client.httpPost(any, body: {"email": "email", "password": "password"}))
        .thenAnswer(
            (_) async => HttpResponse(data: mockJsonUSer, statusCode: 200));
    //Act
    final result = await userDataSource.getUserToken('email', 'password');
    //Assert
    expect(result, true);
    verify(client.httpPost(any,
        body: {"email": "email", "password": "password"})).called(1);
  });

  test('Should return success if return UserFailure on call http get',
      () async {
    //Arrange
    when(client.httpPost(any, body: {"email": "email", "password": "password"}))
        .thenAnswer((_) async => HttpResponse(data: null, statusCode: 400));
    //Act
    final result = userDataSource.getUserToken('email', 'password');
    //Assert
    expect(() => result, throwsA(isA<UserFailure>()));
    // verify(client.httpGet(any)).called(1);
  });
}
