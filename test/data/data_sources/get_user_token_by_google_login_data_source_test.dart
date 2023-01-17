import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/core/errors/failures.dart';
import 'package:poc/core/utils/constants.dart';
import 'package:poc/data/data_sources/get_user_token_by_google_login_data_source.dart';
import 'package:poc/data/external/http_client.dart';

import '../../mock/mock_models.dart';
import 'user_login_data_source_test.mocks.dart';

void main() {
  late IGetUserTokenByGoogleLoginDataSource dataSource;
  late MockHttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = GetUserTokenByGoogleLoginDataSource(client);
  });

  test('Should return sucess if get token by google login', () async {
    //Arrange
    when(client.httpPost(any, body: {"token": null})).thenAnswer(
        (_) async => HttpResponse(data: mockJsonGoogleToken, statusCode: 200));
    //Act
    final result = await dataSource.getUserTokenByGoogleLogin();
    //Assert
    expect(result, true);
    verify(client.httpPost(any, body: {"token": null})).called(1);
  });

  test('Should return sucess if get token by google login fail', () async {
    //Arrange
    when(client.httpPost(any, body: {"token": null})).thenAnswer(
        (_) async => HttpResponse(data: mockJsonGoogleToken, statusCode: 400));
    //Act
    final result = await dataSource.getUserTokenByGoogleLogin();
    //Assert
    expect(result, false);
    verify(client.httpPost(any, body: {"token": null})).called(1);
  });

  //NOTE: Para fazer esse teste eu teria que mockar o GetStora, mas o interessante é injeção de dependencia.
  // test('Should return sucess if get token by google login have to create user',
  //     () async {
  //   //Arrange
  //   when(client.httpPost(apiUrlForGetTokenByGoogleLogin, body: {"token": null}))
  //       .thenAnswer((_) async =>
  //           HttpResponse(data: mockJsonGoogleToken, statusCode: 307));
  //   //Act
  //   final result = await dataSource.getUserTokenByGoogleLogin();
  //   //Assert
  //   expect(result, true);
  //   verify(client.httpPost(apiUrlForGetTokenByGoogleLogin,
  //       body: {"token": 'null'})).called(1);
  // });
}
