import 'package:dartz/dartz.dart';
import 'package:poc/core/errors/failures.dart';
import 'package:poc/domain/repositories/login_repository.dart';

abstract class IGoogleLoginUseCase {
  Future<Either<Failure, bool>> call();
}

class GoogleLoginUseCase extends IGoogleLoginUseCase {
  final ILoginRepository repository;

  GoogleLoginUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call() async {
    return await repository.getUserByGoogleLogin();
  }
}
