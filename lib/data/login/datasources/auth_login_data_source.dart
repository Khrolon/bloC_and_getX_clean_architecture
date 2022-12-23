import 'package:poc/data/login/models/user_model.dart';

abstract class AuthLoginDataSource {
  Future<UserModel> getUser(String email, String password);
}
