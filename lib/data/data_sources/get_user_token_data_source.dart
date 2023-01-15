import 'package:get_storage/get_storage.dart';
import 'package:poc/data/http_client/http_client.dart';
import 'package:poc/core/errors/failures.dart';
import 'package:poc/core/utils/constants.dart';

abstract class IGetUserTokenDataSource {
  Future<bool> getUserToken(String email, String password);
}

class GetUserTokenDataSourceImp implements IGetUserTokenDataSource {
  final HttpClient client;

  GetUserTokenDataSourceImp(this.client);
  @override
  Future<bool> getUserToken(String email, String password) async {
    final response = await client.httpPost(
      apiUrlForGetToken,
      body: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      var data = response.data;
      GetStorage().write('web_token', (data["token"]).toString());
      return true;
    } else {
      throw UserFailure();
    }
  }
}
