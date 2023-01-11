// Mocks generated by Mockito 5.3.2 from annotations
// in poc/test/domain/usecases/user_login_use_cases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:poc/data/data_sources/get_user_token_data_source.dart' as _i3;
import 'package:poc/data/data_sources/user_login_data_source.dart' as _i2;
import 'package:poc/data/repositories/login_repository.dart' as _i5;
import 'package:poc/domain/entities/user_entity.dart' as _i8;
import 'package:poc/core/errors/failures.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIUserLoginDataSource_0 extends _i1.SmartFake
    implements _i2.IUserLoginDataSource {
  _FakeIUserLoginDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIGetUserTokenDataSource_1 extends _i1.SmartFake
    implements _i3.IGetUserTokenDataSource {
  _FakeIGetUserTokenDataSource_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LoginRepositoryImp].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRepositoryImp extends _i1.Mock
    implements _i5.LoginRepositoryImp {
  MockLoginRepositoryImp() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IUserLoginDataSource get userLoginDataSource => (super.noSuchMethod(
        Invocation.getter(#userLoginDataSource),
        returnValue: _FakeIUserLoginDataSource_0(
          this,
          Invocation.getter(#userLoginDataSource),
        ),
      ) as _i2.IUserLoginDataSource);
  @override
  _i3.IGetUserTokenDataSource get getUserTokenDataSource => (super.noSuchMethod(
        Invocation.getter(#getUserTokenDataSource),
        returnValue: _FakeIGetUserTokenDataSource_1(
          this,
          Invocation.getter(#getUserTokenDataSource),
        ),
      ) as _i3.IGetUserTokenDataSource);
  @override
  _i6.Future<_i4.Either<_i7.Failure, _i8.UserEntity>> getUserLogin(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserLogin,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<_i4.Either<_i7.Failure, _i8.UserEntity>>.value(
            _FakeEither_2<_i7.Failure, _i8.UserEntity>(
          this,
          Invocation.method(
            #getUserLogin,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, _i8.UserEntity>>);
  @override
  _i6.Future<_i4.Either<_i7.Failure, bool>> getUserToken(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserToken,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<_i4.Either<_i7.Failure, bool>>.value(
            _FakeEither_2<_i7.Failure, bool>(
          this,
          Invocation.method(
            #getUserToken,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, bool>>);
}
