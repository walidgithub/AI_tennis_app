part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent{
  final CredentialModel credentialModel;

  LoginEvent(this.credentialModel);

  List<Object> get props => [credentialModel];
}

class RegisterEvent extends AuthEvent{
  final CredentialModel credentialModel;

  RegisterEvent(this.credentialModel);

  List<Object> get props => [credentialModel];
}

class LogoutEvent extends AuthEvent{}