import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/core/errors/failures.dart';
import 'package:poc/data/external/google_sign_in.dart';
import 'package:poc/domain/repositories/login_repository.dart';
import 'package:poc/domain/usecases/google_login_use_case.dart';

import 'google_login_use_case_test.mocks.dart';

@GenerateMocks([ILoginRepository])
void main() {
  late IGoogleLoginUseCase useCase;
  late MockILoginRepository repository;

  setUp(() {
    repository = MockILoginRepository();
    useCase = GoogleLoginUseCase(repository);
  });
  test(
      'Should return success if useCase work with a mock repository true return',
      () async {
    //Arrange
    when(repository.getUserByGoogleLogin()).thenAnswer(
      (_) async => Right(
          GoogleSignInUser(displayName: 'nomeTeste', email: '', photoUrl: '')),
    );
    //Act
    final result = await useCase();
    //Assert
    expect(result.fold((l) => null, (r) => r.displayName), 'nomeTeste');
  });

  test(
      'Should return success if useCase fail with a mock repository fail return',
      () async {
    //Arrange
    when(repository.getUserByGoogleLogin()).thenAnswer(
      (_) async => Left(UserFailure()),
    );
    //Act
    final result = await useCase();
    //Assert
    expect(result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
  });
}
