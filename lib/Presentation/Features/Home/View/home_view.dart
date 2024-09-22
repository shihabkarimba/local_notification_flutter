import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_notification_flutter/Bloc/UserProfile/user_profile_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<UserProfileBloc>().add(const OnGetUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                return switch (state) {
                  UserProfileLoadedState(userModel: final userModel) => Row(
                      children: [
                        Text(
                          'Hello ${userModel.name}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  UserProfileInitialState() ||
                  UserProfileLoadingState() ||
                  UserProfileErrorState() =>
                    const SizedBox.shrink(),
                };
              },
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Home'),
            ),
          ),
        ],
      ),
    );
  }
}
