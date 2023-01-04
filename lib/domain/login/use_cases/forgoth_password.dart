import 'package:poc/domain/login/repositories/login_repository.dart';

abstract class ForgothPassword {
  call();
}

class ForgothPasswordImp implements ForgothPassword {
  final LoginRepository repository;

  ForgothPasswordImp(this.repository);

  @override
  call() async {
    return await repository.forgothPassword();
  }
}
