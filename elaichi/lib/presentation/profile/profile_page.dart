import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/components/bottom_sheet/bottom_sheet.dart';
import 'package:elaichi/presentation/components/custom_app_bar.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/home/cubit/home_cubit.dart';
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
    _bloc = ProfileBloc(
      userRepository: context.read<UserRepository>(),
      eventRepository: context.read<EventRepository>(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const CustomAppBar(title: 'Your Account'),
        body: Column(
          children: [
            const Divider(
              thickness: 1,
              height: 1,
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return ColoredBox(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ProfileDetailsCard(
                        icon:
                            const Icon(Icons.settings, color: AppColors.grey3),
                        imageSrc:
                            'https://res.cloudinary.com/dvkroz7wz/image/upload/v1667122918/SWW_1_vhkdpl.png',
                        title: 'Sriram',
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
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Calender',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.grey2,
                                  ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      endIndent: 6,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    'February ${DateTime.now().year}',
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.grey3,
                        ),
                  ),
                  const Expanded(
                    child: Divider(indent: 6, color: AppColors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DateDisplay(dayName: 'MON', dayNumber: '10'),
                    // Expanded(
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     itemCount: _bloc.getEvents().length,
                    //     itemBuilder: (context, index) {
                    //       final event = _bloc.getEvents()[index];
                    //       return EventListCard(
                    //         name: event.name,
                    //         startTime: event.startTime,
                    //         description: event.description,
                    //       );
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EventListCard extends StatelessWidget {
  const EventListCard({
    Key? key,
    required this.name,
    required this.startTime,
    required this.description,
  }) : super(key: key);

  final String name;
  final DateTime startTime;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                '${startTime.hour}:${startTime.minute} PM',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.grey3,
                    ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.grey3,
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    Key? key,
    required this.dayName,
    required this.dayNumber,
  }) : super(key: key);

  final String dayName;
  final String dayNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Column(
        children: [
          Text(
            dayName,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
          ),
          Text(
            dayNumber,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
          )
        ],
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
    final bloc = ProfileBloc(
      userRepository: context.read<UserRepository>(),
      eventRepository: context.read<EventRepository>(),
    );
    return BlocProvider(
      create: (context) => bloc,
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
                    context.read<HomeCubit>().checkIfVerified();
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
                              bloc.add(const ProfileEvent.appLogOut());
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
                          if (bloc.isZimraAuthenticated)
                            TextButton(
                              onPressed: () {
                                bloc.add(const ProfileEvent.webMailLogOut());
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

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
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
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: AppColors.titleText,
                        letterSpacing: 0.1,
                      ),
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
