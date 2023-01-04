import 'package:poc/data/login/datasources/user_login_data_source.dart';
import 'package:poc/domain/login/repositories/user_login_repository.dart';

class UserLoginRepositoryImpl implements UserLoginRepository {
  final UserLoginDataSource dataSource;

  UserLoginRepositoryImpl(this.dataSource);

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
}
