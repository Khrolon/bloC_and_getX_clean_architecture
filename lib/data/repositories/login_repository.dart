import 'package:poc/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/errors/failures.dart';

class LoginRepository extends ILoginRepository{
  @override
  Future<Either<Failure, UserEntity>> userLogin(String email, String password) {
    throw UnimplementedError();
  }
}