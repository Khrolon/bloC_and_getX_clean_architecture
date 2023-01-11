import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/errors/failures.dart';

import 'user_login_use_cases_test.mocks.dart';

@GenerateMocks([MockLoginRepositoryImp])
void main() {
  late IGetTokenUserLoginUseCase useCase;
  late MockLoginRepositoryImp repository;

  setUp(() {
    repository = MockLoginRepositoryImp();
    useCase = GetTokenUserLoginUseCaseImp(repository: repository);
  });
  test('Should return success if user is valid', () async {
    //Arrange
    when(repository.getUserToken(any, any))
        .thenAnswer((realInvocation) async => Right(true));
    //Act
    final result = await useCase('email', 'password');
    //Assert
    expect(result, Right(true));
    verify(repository.getUserToken(any, any)).called(1);
  });

  test('Should return Failure when given a invalid email and password',
      () async {
    when(repository.getUserToken(any, any))
        .thenAnswer((_) async => Left<Failure, bool>(UserFailure()));
    final result = await useCase('email', 'password');
    expect(result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
    verify(repository.getUserToken(any, any)).called(1);
  });
}
