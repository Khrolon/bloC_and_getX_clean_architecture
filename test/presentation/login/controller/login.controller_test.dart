import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/domain/usecases/get_token_user_login_use_cases.dart';
import 'package:poc/domain/usecases/google_login_use_case.dart';
import 'package:poc/domain/usecases/user_login_use_cases.dart';
import 'package:poc/presentation/login/controller/login.controller.dart';

import '../../../mock/mock_models.dart';
import 'login.controller_test.mocks.dart';

@GenerateMocks(
    [IGetTokenUserLoginUseCase, IUserLoginUseCase, IGoogleLoginUseCase])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  late LoginController controller;
  late IGetTokenUserLoginUseCase getTokenUserLoginUseCase;
  late IUserLoginUseCase userLoginUseCase;
  late IGoogleLoginUseCase googleLoginUseCase;

  setUp(() {
    getTokenUserLoginUseCase = MockIGetTokenUserLoginUseCase();
    userLoginUseCase = MockIUserLoginUseCase();
    googleLoginUseCase = MockIGoogleLoginUseCase();
    controller = LoginController(
      getTokenUserLoginUseCase: getTokenUserLoginUseCase,
      userLoginUseCase: userLoginUseCase,
      googleLoginUseCase: googleLoginUseCase,
    );
  });
  test('Should return success if call user login methods on controller',
      () async {
    //Arrange
    when(getTokenUserLoginUseCase('', '')).thenAnswer((_) async => Right(true));
    when(userLoginUseCase()).thenAnswer((_) async => Right(mockUserModel));
    //Act
    await controller.userLogin();
    //Assert
    verify(getTokenUserLoginUseCase('', '')).called(1);
    verify(userLoginUseCase()).called(1);
  });

  test('Should return success if call google login methods on controller',
      () async {
    //Arrange
    when(googleLoginUseCase()).thenAnswer((_) async => Right(true));
    when(userLoginUseCase()).thenAnswer((_) async => Right(mockUserModel));
    //Act
    await controller.googleLogin();
    //Assert
    verify(googleLoginUseCase()).called(1);
    verify(userLoginUseCase()).called(1);
  });
}
