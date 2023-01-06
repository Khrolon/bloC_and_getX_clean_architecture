import 'package:poc/data/login/models/user_model.dart';
import 'package:poc/global/constansts.dart';
import 'package:get/get_connect/connect.dart';

abstract class UserLoginDataSource extends GetConnect {
  Future<bool> login(String email, String password);
}

class UserLoginData extends UserLoginDataSource {

  @override
  Future<bool> login(String email, String password) async {
    print("Print chegou na camada data.");

    final response = await post(
      apiLoginPath,
      {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      // var userModel = UserModel.fromJson(response.data);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
