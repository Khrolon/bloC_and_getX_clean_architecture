// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/data/models/user_model.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/errors/failures.dart';

class LoginRepositoryImp extends ILoginRepository {
  final IUserLoginDataSource userLoginDataSource;
  final IGetUserTokenDataSource getUserTokenDataSource;

  LoginRepositoryImp(
    this.userLoginDataSource,
    this.getUserTokenDataSource,
  );

  @override
  Future<Either<Failure, UserEntity>> getUserLogin(
      String email, String password) async {
    try {
      UserModel result =
          await userLoginDataSource.getUserLogin(email, password);
      return Right(result);
    } catch (e) {
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getUserToken(
      String email, String password) async {
    try {
      await getUserTokenDataSource.getUserToken(email, password);
      return Right(true);
    } catch (e) {
      return Left(UserFailure());
    }
  }
}
