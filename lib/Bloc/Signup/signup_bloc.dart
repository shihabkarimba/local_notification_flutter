import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../Core/Constants/usages.dart';
import '../../Domain/Repository/FirebaseAuthRepo/firebase_auth_repo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final _auth = GetIt.I<FirebaseAuthRepository>();

  SignupBloc() : super(SignupInitialState()) {
    on<OnSignupButtonPressedEvent>(_onSignupButtonPressed);
  }
  void _onSignupButtonPressed(
      OnSignupButtonPressedEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoadingState());

    try {
      final (isSuccess, error) = await _auth.signUpUser(
          email: event.email, password: event.password, name: event.name);
      if (isSuccess) {
        emit(SignupLoadedState());
      } else {
        emit(SignupErrorState(message: error?.message ?? Usages.errorMessage));
      }
    } catch (e) {
      emit(const SignupErrorState(message: Usages.errorMessage));
    }
  }
}
