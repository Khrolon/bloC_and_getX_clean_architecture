import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/core/errors/failures.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/google_login_use_case.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/infrastructure/inject/inject.dart';
import 'package:poc/presentation/login/bloc/login_bloc.dart';
import 'package:poc/presentation/login/bloc/login_event.dart';
import 'package:poc/presentation/login/bloc/login_state.dart';

import '../../../mock/mock_models.dart';
import 'login_bloc_test.mocks.dart';

@GenerateMocks(
    [UserLoginUseCase, GetTokenUserLoginUseCaseImp, GoogleLoginUseCase])
void main() {
  Inject.init();
  late MockUserLoginUseCase userLoginUseCase = MockUserLoginUseCase();
  late MockGetTokenUserLoginUseCaseImp getTokenUser =
      MockGetTokenUserLoginUseCaseImp();
  late MockGoogleLoginUseCase googleLoginUseCase = MockGoogleLoginUseCase();

  final bloc = LoginBloc(
    userLoginUseCase: userLoginUseCase,
    getTokenUserLoginUseCase: getTokenUser,
    googleLoginUseCase: googleLoginUseCase,
  );

  test("Should return success on emitsInOrder user error case", () {
    //Arrange
    when(getTokenUser(any, any)).thenAnswer((_) async => Left(UserFailure()));
    //Act
    bloc.add(LoginEventGetToken(email: "email", password: "password"));
    //Assert
    expect(
      bloc.stream,
      emitsInOrder(
        [
          isA<LoginStateLoading>(),
          isA<LoginStateError>(),
        ],
      ),
    );
  });

  test("Should return success on emitsInOrder user login complete case", () {
    //Arrange
    when(getTokenUser(any, any)).thenAnswer((_) async => Right(true));
    when(userLoginUseCase()).thenAnswer((_) async => Right(mockUserModel));
    //Act
    bloc.add(LoginEventGetToken(email: "email", password: "password"));
    //Assert
    expect(
      bloc.stream,
      emitsInOrder(
        [
          isA<LoginStateLoading>(),
          isA<LoginCompleteGoToSecondPage>(),
        ],
      ),
    );
  });

  test(
      "Should return success on emitsInOrder user error case in event: LoginEventGetUser",
      () {
    //Arrange
    when(getTokenUser(any, any)).thenAnswer((_) async => Right(true));
    when(userLoginUseCase()).thenAnswer((_) async => Left(UserFailure()));
    //Act
    bloc.add(LoginEventGetToken(email: "email", password: "password"));
    //Assert
    expect(
      bloc.stream,
      emitsInOrder(
        [
          isA<LoginStateLoading>(),
          isA<LoginStateError>(),
        ],
      ),
    );
  });

  test(
      "Should return success on emitsInOrder case in event: LoginEventGoogleLogin",
      () {
    //Arrange
    when(googleLoginUseCase()).thenAnswer((_) async => Right(true));
    when(userLoginUseCase()).thenAnswer((_) async => Right(mockUserModel));
    //Act
    bloc.add(LoginEventGoogleLogin());
    //Assert
    expect(
      bloc.stream,
      emitsInOrder(
        [
          isA<LoginStateLoading>(),
          isA<LoginCompleteGoToSecondPage>(),
        ],
      ),
    );
  });
}
