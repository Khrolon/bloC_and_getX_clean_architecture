import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEventGetToken extends LoginEvent {
  final String email;
  final String password;

  LoginEventGetToken({required this.email, required this.password});
}

class LoginEventGetUser extends LoginEvent {}

class LoginEventForgothPassword extends LoginEvent {}

class LoginEventGoogleLogin extends LoginEvent {}

class LoginEventCreateUser extends LoginEvent {}

class LoginEventShowPassword extends LoginEvent {}

class LoginEventHidePassword extends LoginEvent {}
