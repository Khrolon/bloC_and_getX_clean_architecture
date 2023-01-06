import 'package:poc/domain/login/repositories/login_repository.dart';

abstract class UserLogin {
  Future<bool> call(String email, String password);
}

class UserLoginImp extends UserLogin {
  final LoginRepository repository;

  UserLoginImp(this.repository);

  @override
  Future<bool> call(String email, String password) async {
    print("Passou pela camada de domain.");
    return await repository.userLogin(email, password);
  }
}
