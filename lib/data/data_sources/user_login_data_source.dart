import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poc/data/http_client/http_client.dart';
import 'package:poc/data/models/user_model.dart';
import 'package:poc/errors/failures.dart';
import 'package:poc/utils/constants.dart';

abstract class IUserLoginDataSource {
  Future<UserModel> getUserLogin(String email, String password);
}

class UserDataSourceImp implements IUserLoginDataSource {
  final HttpClient client;

  UserDataSourceImp(this.client);
  @override
  Future<UserModel> getUserLogin(String email, String password) async {
    final response = await client.httpGet(apiUrlForLogin);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.data));
    } else {
      throw UserFailure();
    }
  }
}
