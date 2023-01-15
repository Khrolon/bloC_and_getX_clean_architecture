import 'package:equatable/equatable.dart';
import 'package:poc/data/models/user_model.dart';
import 'package:poc/domain/entities/user_entity.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateLoading extends LoginState {}

class LoginStateAuthPending extends LoginState {}

class LoginStateError extends LoginState {
  final String error;

  LoginStateError(this.error);
}

class LoginCompleteGoToSecondPage extends LoginState {
  final UserEntity userModel;

  LoginCompleteGoToSecondPage(this.userModel);
}
