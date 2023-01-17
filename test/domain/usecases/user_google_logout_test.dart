import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/core/errors/failures.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/domain/usecases/user_google_logout.dart';

import 'user_login_use_cases_test.mocks.dart';

void main() {
  late IUserGoogleLogoutUseCase userCase;
  late ILoginRepository repository;

  setUp(() {
    repository = MockLoginRepositoryImp();
    userCase = UserGoogleLogoutUseCase(repository);
  });
  test('Should return success if logout works', () async {
    //Arrange
    when(repository.userGoogleLogout()).thenAnswer((_) async => Right(true));
    //Act
    final result = await userCase();
    //Assert
    expect(result, Right(true));
  });

  test('Should return success if logout fails', () async {
    //Arrange
    when(repository.userGoogleLogout())
        .thenThrow((_) async => Left(UserFailure()));
    //Act
    final result = await userCase();
    //Assert
    expect(result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
  });
}
