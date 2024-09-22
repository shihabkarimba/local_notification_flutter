part of 'user_profile_bloc.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();
  @override
  List<Object?> get props => [];
}

final class UserProfileInitialState extends UserProfileState {}

final class UserProfileLoadedState extends UserProfileState {
  final UserModel userModel;
  const UserProfileLoadedState({
    required this.userModel,
  });
}

final class UserProfileLoadingState extends UserProfileState {}

final class UserProfileErrorState extends UserProfileState {
  const UserProfileErrorState();

  @override
  List<Object?> get props => [];
}
