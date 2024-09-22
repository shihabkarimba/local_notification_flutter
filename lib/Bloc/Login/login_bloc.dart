import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:local_notification_flutter/Core/Constants/Usages/usages.dart';
import 'package:local_notification_flutter/Domain/Repository/FirebaseAuthRepo/firebase_auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _auth = GetIt.I<FirebaseAuthRepository>();

  LoginBloc() : super(LoginInitialState()) {
    on<OnLoginButtonPressedEvent>(_onLoginButtonPressed);
  }
  void _onLoginButtonPressed(
      OnLoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    try {
      final (isSuccess, error) =
          await _auth.loginUser(email: event.email, password: event.password);
      if (isSuccess) {
        emit(LoginLoadedState());
      } else {
        emit(LoginErrorState(message: error?.message ?? Usages.errorMessage));
      }
    } catch (e) {
      emit(const LoginErrorState(message: Usages.errorMessage));
    }
  }
}
