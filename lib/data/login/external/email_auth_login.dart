import 'package:dio/dio.dart';
import 'package:poc/data/login/datasources/auth_login_data_source.dart';
import 'package:poc/data/login/models/user_model.dart';
import 'package:poc/global/constansts.dart';

class EmailAuthLoginDataSource extends AuthLoginDataSource {
  final Dio? dio;

  EmailAuthLoginDataSource(this.dio);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await dio!
        .post(apiAuthPath, data: {"email": email, "password": password});
    if (response.statusCode == 200) {
      var userModel = UserModel.fromJson(response.data);
      return userModel;
    }
    return UserModel(0, 'name', 'email', true);
  }
}
