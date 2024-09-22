part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object?> get props => [];
}

final class SignupInitialState extends SignupState {}

final class SignupLoadedState extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupErrorState extends SignupState {
  final String message;
  const SignupErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
