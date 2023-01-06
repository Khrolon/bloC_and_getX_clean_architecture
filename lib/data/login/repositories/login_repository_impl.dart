import 'package:poc/data/login/external/google_login_data_source.dart';
import 'package:poc/data/login/external/user_login_data_source.dart';
import 'package:poc/domain/login/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final UserLoginData userLoginData;
  final GoogleLoginDataSource googleLoginDataSource;

  LoginRepositoryImpl(this.userLoginData, this.googleLoginDataSource);

  @override
  Future<bool> userLogin(String email, String password) async {
    return await userLoginData.login(email, password);
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
  Future<bool> googleLogin() async {
    return await googleLoginDataSource.googleLogin();
  }
}
