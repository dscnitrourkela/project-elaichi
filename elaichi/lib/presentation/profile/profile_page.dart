import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/bottom_sheet/bottom_sheet.dart';
import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
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
        appBar: const CustomAppBar(title: 'Your Account'),
        body: Column(
          children: [
            const Divider(
              thickness: 1,
              height: 1,
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return ProfileDetails(
                  icon: const Icon(Icons.settings, color: AppColors.grey3),
                  imageSrc: Splash.instance().getUser!.photoURL.toString(),
                  title: Splash.instance().getUser!.displayName!,
                  subTitle: _bloc.isZimraAuthenticated
                      ? _bloc.rollNumber!.toUpperCase()
                      : null,
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (context) => PreferencesBottomSheet(),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PreferencesBottomSheet extends StatelessWidget {
  PreferencesBottomSheet({
    Key? key,
  }) : super(key: key);

  final _toastUtil = ToastUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    final _bloc = ProfileBloc(userRepository: context.read<UserRepository>());
    return BlocProvider(
      create: (context) => _bloc,
      child: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  appLoggedOut: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.splash,
                      (route) => false,
                    );
                  },
                  webMailLoggedOut: () {
                    _toastUtil.showToast(
                      mode: ToastMode.Success,
                      title: 'Successfully Deregistered webmail',
                    );
                    Navigator.pop(context);
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const CircularProgressIndicator(),
                  orElse: () => CustomBottomSheet(
                    title: 'Preferences',
                    body: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              _bloc.add(const ProfileEvent.appLogOut());
                            },
                            child: Text(
                              'Sign Out of Avenue',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: AppColors.warningRed,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          if (_bloc.isZimraAuthenticated)
                            TextButton(
                              onPressed: () {
                                _bloc.add(const ProfileEvent.webMailLogOut());
                              },
                              child: Text(
                                'Deregister Webmail',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: AppColors.warningRed,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    footer: Container(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.title,
    this.subTitle,
    required this.imageSrc,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String? subTitle;
  final String imageSrc;
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              imageSrc,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person),
              height: 48,
              width: 48,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: AppColors.titleText),
                ),
            ],
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}
