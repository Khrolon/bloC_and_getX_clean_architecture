import 'package:poc/domain/login/repositories/login_repository.dart';

abstract class GoogleSign {
  Future<bool> call();
}

class GoogleSignImp extends GoogleSign {
  final LoginRepository _loginRepository;

  GoogleSignImp(this._loginRepository);
  @override
  Future<bool> call() async {
    print("Passou pela camada de domain.");
    return await _loginRepository.googleLogin();
  }
}
