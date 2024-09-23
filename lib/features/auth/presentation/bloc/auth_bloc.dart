import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth/domain/entities/user_model.dart';
import '../../../../core/utils/enums/RequestState.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc(this.loginUseCase, this.registerUseCase) : super(const AuthState()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authState: RequestState.loading, authMessage: ""));
    final result = await loginUseCase(event.userModel);
    result.fold(
        (l) => emit(state.copyWith(
            authState: RequestState.error, authMessage: l.message)),
        (r) => emit(state.copyWith(
              authState: RequestState.done,
            )));
  }

  FutureOr<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authState: RequestState.loading, authMessage: ""));
    final result = await registerUseCase(event.userModel);
    result.fold(
        (l) => emit(state.copyWith(
            authState: RequestState.error, authMessage: l.message)),
        (r) => emit(state.copyWith(
              authState: RequestState.done,
            )));
  }
}
