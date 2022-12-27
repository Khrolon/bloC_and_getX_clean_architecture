import 'package:poc/data/login/datasources/auth_login_data_source.dart';
import 'package:poc/domain/login/repositories/auth_login_repository.dart';

class AuthLoginRepositoryImpl implements AuthLoginRepository {
  final AuthLoginDataSource dataSource;

  AuthLoginRepositoryImpl(this.dataSource);

  @override
  Future<bool> authLogin(String email, String password) async {
    try {
      dataSource.login(email, password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
