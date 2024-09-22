part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

final class LoginInitialState extends LoginState {}

final class LoginLoadedState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;
  const LoginErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
