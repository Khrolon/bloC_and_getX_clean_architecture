import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/http_client/http_client.dart';
import 'package:poc/errors/failures.dart';

import '../../mock/mock_models.dart';
import 'user_login_data_source_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  late IUserLoginDataSource userDataSource;
  late MockHttpClient client;

  setUp(() {
    client = MockHttpClient();
    userDataSource = UserDataSourceImp(client);
  });

  test('Should return success if call http get with correct url', () async {
    //Arrange
    when(client.httpGet(any)).thenAnswer(
        (_) async => HttpResponse(data: mockJsonUSer, statusCode: 200));
    //Act
    final result = await userDataSource.getUserLogin('email', 'password');
    //Assert
    expect(result.name, mockUserModel.name);
    verify(client.httpGet(any)).called(1);
  });

  test('Should return success if return UserFailure on call http get',
      () async {
    //Arrange
    when(client.httpGet(any))
        .thenAnswer((_) async => HttpResponse(data: null, statusCode: 400));
    //Act
    final result = userDataSource.getUserLogin('email', 'password');
    //Assert
    expect(() => result, throwsA(isA<UserFailure>()));
    // verify(client.httpGet(any)).called(1);
  });
}
