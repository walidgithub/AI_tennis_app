part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final RequestState authState;
  final String authMessage;

  const AuthState({
    this.authState = RequestState.loading,
    this.authMessage = '',
  });

  AuthState copyWith({
    RequestState? authState,
    String? authMessage,
  }) {
    return AuthState(
        authState: authState ?? this.authState,
        authMessage: authMessage ?? this.authMessage);
  }

  @override
  List<Object?> get props => [authState, authMessage];
}
