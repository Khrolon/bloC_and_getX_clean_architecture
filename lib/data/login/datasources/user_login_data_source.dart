import 'package:poc/data/login/models/user_model.dart';

abstract class UserLoginDataSource {
  Future<UserModel> login(String email, String password);
}
