import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/login/external/email_auth_login.dart';

import 'email_auth_login_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final dio = MockDio();
  final dataSourcer = EmailAuthLoginDataSource(dio);
  test('Should return success if found API', () async {
    when(dio.post(any)).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {},
          statusCode: 200,
        ));

    final future = dataSourcer.login('email', 'password');
    expect(future, completes);
  });
}
