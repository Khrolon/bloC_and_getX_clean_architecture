import 'package:poc/domain/login/repositories/auth_login_repository.dart';

abstract class AuthLogin {
  Future<bool> call(String email, String password);
}

class AuthLoginImp implements AuthLogin {
  final AuthLoginRepository repository;

  AuthLoginImp(this.repository);

  @override
  Future<bool> call(String email, String password) async {
    return await repository.authLogin(email, password);
  }
}
