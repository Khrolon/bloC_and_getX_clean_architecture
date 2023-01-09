// Mocks generated by Mockito 5.3.2 from annotations
// in poc/test/data/repositories/login_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:poc/data/data_sources/user_login_data_source.dart' as _i3;
import 'package:poc/data/models/user_model.dart' as _i2;

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

class _FakeUserModel_0 extends _i1.SmartFake implements _i2.UserModel {
  _FakeUserModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IUserLoginDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIUserLoginDataSource extends _i1.Mock
    implements _i3.IUserLoginDataSource {
  MockIUserLoginDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserModel> userLogin(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #userLogin,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.UserModel>.value(_FakeUserModel_0(
          this,
          Invocation.method(
            #userLogin,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.UserModel>);
}
