import 'package:dartz/dartz.dart';
import 'package:poc/domain/repositories/login_repository.dart';

import '../../core/errors/failures.dart';

abstract class IUserGoogleLogoutUseCase {
  Future<Either<Failure, bool>> call();
}

class UserGoogleLogoutUseCase extends IUserGoogleLogoutUseCase {
  final ILoginRepository repository;

  UserGoogleLogoutUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call() async {
    try {
      await repository.userGoogleLogout();
      return Right(true);
    } catch (e) {
      return Left(UserFailure());
    }
  }
}
