import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/buttons/blue_button.dart';
import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///The Profile Page
class ProfilePage extends StatefulWidget {
  /// Default constructor
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileBloc _bloc;

  final _toastUtil = ToastUtil.getInstance();

  @override
  void initState() {
    _bloc = ProfileBloc(userRepository: context.read<UserRepository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Profile'),
        body: Center(
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                appLoggedOut: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouter.splash,
                  (route) => false,
                ),
                webMailLoggedOut: () => _toastUtil.showToast(
                  mode: ToastMode.Success,
                  title: 'Successfully logged out of webmail',
                ),
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Column(
                  children: [
                    if (_bloc.isZimraAuthenticated)
                      BlueButton(
                        text: 'Web Mail Logout',
                        onTapped: () {
                          _bloc.add(const ProfileEvent.webMailLogOut());
                        },
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlueButton(
                      text: 'App Logout',
                      onTapped: () {
                        _bloc.add(const ProfileEvent.appLogOut());
                      },
                    ),
                  ],
                ),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
