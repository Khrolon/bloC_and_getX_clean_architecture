import 'package:poc/data/login/external/user_login.dart';
import 'package:poc/domain/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final UserLoginData dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<bool> userLogin(String email, String password) async {
    try {
      dataSource.login(email, password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  createUser() {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  forgothPassword() {
    // TODO: implement forgothPassword
    throw UnimplementedError();
  }

  @override
  googleLogin() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}
