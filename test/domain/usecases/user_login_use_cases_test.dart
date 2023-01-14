import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/data/repositories/login_repository.dart';
import 'package:poc/domain/entities/user_entity.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/core/errors/failures.dart';

import '../../mock/mock_models.dart';
import 'user_login_use_cases_test.mocks.dart';

@GenerateMocks([LoginRepositoryImp])
void main() {
  late LoginRepositoryImp repository;
  late UserLoginUseCase usecase;

  setUp(() {
    repository = MockLoginRepositoryImp();
    usecase = UserLoginUseCase(repository);
  });
  test('Should return UserModel when given a valid email and password',
      () async {
    when(repository.getUserLogin())
        .thenAnswer((_) async => Right<Failure, UserEntity>(mockUser));
    final result = await usecase();
    expect(result, Right(mockUser));
    verify(repository.getUserLogin()).called(1);
  });

  test('Should return Failure when given a invalid email and password',
      () async {
    when(repository.getUserLogin())
        .thenAnswer((_) async => Left<Failure, UserEntity>(UserFailure()));
    final result = await usecase();
    expect(result.fold((l) => UserFailure(), (r) => null), isA<UserFailure>());
    verify(repository.getUserLogin()).called(1);
  });
}
