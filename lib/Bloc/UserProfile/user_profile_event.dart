part of 'user_profile_bloc.dart';

sealed class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object?> get props => [];
}

final class OnGetUserProfileEvent extends UserProfileEvent {
  const OnGetUserProfileEvent();
}
