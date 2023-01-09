import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/models/user_model.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/errors/failures.dart';

class LoginRepositoryImp extends ILoginRepository {
  final IUserLoginDataSource userLoginDataSource;

  LoginRepositoryImp(this.userLoginDataSource);

  @override
  Future<Either<Failure, UserEntity>> userLogin(
      String email, String password) async {
    try {
      UserModel result = await userLoginDataSource.userLogin(email, password);
      return Right(result);
    } catch (e) {
      return Left(UserFailure());
    }
  }
}
