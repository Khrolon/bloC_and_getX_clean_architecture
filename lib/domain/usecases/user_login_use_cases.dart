import 'package:dartz/dartz.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/core/errors/failures.dart';

abstract class IUserLoginUseCase {
  Future<Either<Failure, UserEntity>> call();
}

class UserLoginUseCase implements IUserLoginUseCase {
  final ILoginRepository repository;

  UserLoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await repository.getUserLogin();
  }
}
