// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:poc/domain/repositories/login_repository.dart';

import '../../core/errors/failures.dart';

abstract class IGetTokenUserLoginUseCase {
  Future<Either<Failure, bool>> call(String email, String password);
}

class GetTokenUserLoginUseCaseImp implements IGetTokenUserLoginUseCase {
  final ILoginRepository repository;
  GetTokenUserLoginUseCaseImp({
    required this.repository,
  });
  @override
  Future<Either<Failure, bool>> call(String email, String password) async {
    return await repository.getUserToken(email, password);
  }
}
