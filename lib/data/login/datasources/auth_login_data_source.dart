import 'package:poc/data/login/models/user_model.dart';

abstract class AuthLoginDataSource {
  Future<UserModel> login(String email, String password);
}
