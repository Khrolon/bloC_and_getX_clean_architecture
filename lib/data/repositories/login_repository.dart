// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:poc/core/errors/failures.dart';
import 'package:poc/core/utils/constants.dart';
import 'package:poc/data/data_sources/get_user_by_google_login_data_source.dart';
import 'package:poc/data/data_sources/get_user_token_by_google_login_data_source.dart';
import 'package:poc/data/data_sources/get_user_token_data_source.dart';
import 'package:poc/data/data_sources/user_google_logout_data_source.dart';
import 'package:poc/data/data_sources/user_login_data_source.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/repositories/login_repository.dart';

class LoginRepositoryImp extends ILoginRepository {
  final IUserLoginDataSource userLoginDataSource;
  final IGetUserTokenDataSource getUserTokenDataSource;
  final IGetUserByGoogleLoginDataSource getUserByGoogleLoginDataSource;
  final IGetUserTokenByGoogleLoginDataSource
      getUserTokenByGoogleLoginDataSource;
  final IUserGoogleLogoutDataSource userGoogleLogoutDataSource;

  LoginRepositoryImp({
    required this.userLoginDataSource,
    required this.getUserTokenDataSource,
    required this.getUserByGoogleLoginDataSource,
    required this.getUserTokenByGoogleLoginDataSource,
    required this.userGoogleLogoutDataSource,
});

  @override
  Future<Either<Failure, UserEntity>> getUserLogin() async {
    try {
      globalUserLogged = await userLoginDataSource.getUserLogin();
      return Right(globalUserLogged);
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

  @override
  Future<Either<Failure, bool>> getUserByGoogleLogin() async {
    try {
      await getUserByGoogleLoginDataSource.getUserByGoogleLogin();
      final result = await getUserTokenByGoogleLogin();
      return result.fold((l) => Left(UserFailure()), (r) => Right(r));
    } catch (e) {
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getUserTokenByGoogleLogin() async {
    try {
      await getUserTokenByGoogleLoginDataSource.getUserTokenByGoogleLogin();
      return Right(true);
    } catch (e) {
      return Left(UserFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> userGoogleLogout() async {
    try {
      await userGoogleLogoutDataSource.userGoogleLogout();
      return Right(true);
    } catch (e) {
      return left(UserFailure());
    }
  }
}
