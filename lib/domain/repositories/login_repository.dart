import 'package:dartz/dartz.dart';
import 'package:poc/data/external/google_sign_in.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/core/errors/failures.dart';

abstract class ILoginRepository {
  Future<Either<Failure, bool>> getUserToken(String email, String password);
  Future<Either<Failure, UserEntity>> getUserLogin();
  Future<Either<Failure, GoogleSignInUser>> getUserByGoogleLogin();
}
