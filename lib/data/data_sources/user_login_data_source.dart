import 'package:poc/data/models/user_model.dart';

abstract class IUserLoginDataSource {
  Future<UserModel> userLogin(String email, String password);
}

class UserDataSourceImp implements IUserLoginDataSource {
  @override
  Future<UserModel> userLogin(String email, String password) {
    throw UnimplementedError();
  }
}
