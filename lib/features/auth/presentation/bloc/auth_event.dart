part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent{
  final UserModel userModel;

  LoginEvent(this.userModel);

  List<Object> get props => [userModel];
}

class RegisterEvent extends AuthEvent{
  final UserModel userModel;

  RegisterEvent(this.userModel);

  List<Object> get props => [userModel];
}