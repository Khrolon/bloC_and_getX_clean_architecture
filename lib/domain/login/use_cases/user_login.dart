import 'package:poc/domain/login/repositories/user_login_repository.dart';

abstract class UserLogin {
  Future<bool> call(String email, String password);
}

class UserLoginImp implements UserLogin {
  final UserLoginRepository repository;

  UserLoginImp(this.repository);

  @override
  Future<bool> call(String email, String password) async {
    return await repository.userLogin(email, password);
  }
}
