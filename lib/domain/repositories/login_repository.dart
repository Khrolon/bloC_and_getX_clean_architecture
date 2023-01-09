import 'package:dartz/dartz.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/errors/failures.dart';

abstract class ILoginRepository {
  Future<Either<Failure, UserEntity>> userLogin(String email, String password);
}
