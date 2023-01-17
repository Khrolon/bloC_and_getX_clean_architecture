import 'package:get_storage/get_storage.dart';
import 'package:poc/core/utils/constants.dart';
import 'package:poc/data/external/http_client.dart';

abstract class IGetUserTokenByGoogleLoginDataSource {
  Future<bool> getUserTokenByGoogleLogin();
}

class GetUserTokenByGoogleLoginDataSource
    extends IGetUserTokenByGoogleLoginDataSource {
  final HttpClient client;

  GetUserTokenByGoogleLoginDataSource(this.client);

  @override
  Future<bool> getUserTokenByGoogleLogin() async {
    final token = GetStorage().read('web_token');
    final response = await client
        .httpPost(apiUrlForGetTokenByGoogleLogin, body: {"token": token});
    if (response.statusCode == 200) {
      var data = response.data;
      GetStorage().write('web_token', (data["token"]).toString());
      return true;
    } else if (response.statusCode == 307) {
      await _createGoogleUser(token);
    }
    return false;
  }

  Future<void> _createGoogleUser(String token) async {
    final response = await client
        .httpPost(apiUrlForCreateUserByGoogleLogin, body: {"token": token});
    if (response.statusCode == 200) {
      var data = response.data;
      GetStorage().write('web_token', (data["token"]).toString());
    } else {
      throw Exception();
    }
  }
}
