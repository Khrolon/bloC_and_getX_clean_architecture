import 'package:poc/data/external/http_client.dart';
import 'package:poc/data/models/user_model.dart';
import 'package:poc/core/errors/failures.dart';
import 'package:poc/core/utils/constants.dart';

abstract class IUserLoginDataSource {
  Future<UserModel> getUserLogin();
}

class UserDataSourceImp implements IUserLoginDataSource {
  final HttpClient client;

  UserDataSourceImp(this.client);
  @override
  Future<UserModel> getUserLogin() async {
    final response = await client.httpGet(apiUrlForGetUserData);
    if (response.statusCode == 200) {
      var userModel = UserModel.fromJson(response.data);
      return userModel;
    } else {
      throw UserFailure();
    }
  }
}
