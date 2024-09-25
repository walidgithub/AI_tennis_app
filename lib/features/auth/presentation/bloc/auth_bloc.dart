import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_usecase/firebase_base_usecase.dart';
import '../../../../core/utils/enums/RequestState.dart';
import '../../domain/entities/credential_model.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc(this.loginUseCase, this.registerUseCase, this.logoutUseCase)
      : super(const AuthState()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
    on<LogoutEvent>(_logout);
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authState: RequestState.loading, authMessage: ""));
    final result = await loginUseCase(event.credentialModel);
    result.fold(
        (l) => emit(state.copyWith(
            authState: RequestState.error, authMessage: l.message)),
        (r) => emit(state.copyWith(
              authState: RequestState.done,
            )));
  }

  FutureOr<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authState: RequestState.loading, authMessage: ""));
    final result = await registerUseCase(event.credentialModel);
    result.fold(
        (l) => emit(state.copyWith(
            authState: RequestState.error, authMessage: l.message)),
        (r) => emit(state.copyWith(
              authState: RequestState.done,
            )));
  }

  FutureOr<void> _logout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authState: RequestState.loading, authMessage: ""));
    final result = await logoutUseCase(const FirebaseNoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            authState: RequestState.error, authMessage: l.message)),
        (r) => emit(state.copyWith(
              authState: RequestState.done,
            )));
  }
}
