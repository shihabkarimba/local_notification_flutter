part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

final class OnSignupButtonPressedEvent extends SignupEvent {
  final String email;
  final String password;
  final String name;
  const OnSignupButtonPressedEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object?> get props => [email, password];
}
