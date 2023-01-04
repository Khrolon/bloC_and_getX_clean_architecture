import 'package:dio/dio.dart';
import 'package:poc/data/login/datasources/user_login_data_source.dart';
import 'package:poc/data/login/models/user_model.dart';
import 'package:poc/global/constansts.dart';

class UserLoginData extends UserLoginDataSource {
  final Dio? dio;

  UserLoginData(this.dio);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await dio!
        .post(apiAuthPath, data: {"email": email, "password": password});
    if (response.statusCode == 200) {
      var userModel = UserModel.fromJson(response.data);
      return userModel;
    }
    return UserModel(id: 0, name: 'name', email: 'email', isDev: true);
  }
}
