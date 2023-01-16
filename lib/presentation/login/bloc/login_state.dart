import 'package:equatable/equatable.dart';

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

class LoginCompleteGoToSecondPage extends LoginState {}
