import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:local_notification_flutter/Domain/Repository/LocalAuthRepo/local_auth_repo.dart';
import 'package:local_notification_flutter/Presentation/Shared/Widgets/show_dialog.dart';

import '../../../../Bloc/UserProfile/user_profile_bloc.dart';
import '../../../../Core/Router/route.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
              .copyWith(top: 50),
          constraints: const BoxConstraints(
            minWidth: double.maxFinite,
            minHeight: 100,
          ),
          decoration: BoxDecoration(color: Colors.yellow.shade50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<UserProfileBloc, UserProfileState>(
                builder: (context, state) {
                  return switch (state) {
                    UserProfileLoadedState(userModel: final userData) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userData.name}'),
                          Text('${userData.email}'),
                        ],
                      ),
                    UserProfileInitialState() ||
                    UserProfileLoadingState() ||
                    UserProfileErrorState() =>
                      const Expanded(child: SizedBox.shrink())
                  };
                },
              ),
              IconButton(
                onPressed: () {
                  buildDialog(
                      context: context,
                      content: 'Are you sure you want to logout',
                      onButtonPressed: () async {
                        router.goNamed(Routes.login.name);
                        await GetIt.I<LocalAuthRepository>().removeUser();
                      },
                      actionText: 'Logout',
                      title: 'Warning');
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
