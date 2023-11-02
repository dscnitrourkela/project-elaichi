import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/explore/cubit/registration_cubit.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EventDetailsPage extends StatelessWidget {
  EventDetailsPage({
    super.key,
    required this.event,
  });

  final Event event;

  final toastUtil = ToastUtil.getInstance();
  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM');
    final description = jsonDecode(event.description) as List<dynamic>;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: RegisterBottomBar(
          child: BlocConsumer<RegistrationCubit, RegistrationState>(
            bloc: context.read<RegistrationCubit>(),
            listener: (context, state) {
              state.whenOrNull(
                success: () {},
                error: (error) {
                  if (error == 'User Not Registered Event_Details') {
                    toastUtil.showToast(
                      mode: ToastMode.Error,
                      title: 'Please Register for Fest First',
                    );
                  } else {
                    toastUtil.showToast(
                      mode: ToastMode.Error,
                      title: error,
                    );
                  }
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                initial: (eventRegistrations) {
                  return (eventRegistrations
                          .where(
                            (element) => event.id == element.eventID,
                          )
                          .isNotEmpty)
                      ? Text(
                          'Registered',
                          style: interTextTheme.bodyLarge,
                        )
                      : YellowFlatButton(
                          onTapped: () async {
                            await context
                                .read<RegistrationCubit>()
                                .createEventRegistration(
                                  event: event,
                                  page: 'Event_Details',
                                );
                          },
                          text: 'Register',
                        );
                },
                orElse: () => YellowFlatButton(
                  onTapped: () async {
                    await context
                        .read<RegistrationCubit>()
                        .createEventRegistration(
                          event: event,
                          page: 'Event_Details',
                        );
                  },
                  text: 'Register',
                ),
                loading: (eventID) {
                  return eventID == event.id
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : YellowFlatButton(
                          onTapped: () async {
                            await context
                                .read<RegistrationCubit>()
                                .createEventRegistration(
                                  event: event,
                                  page: 'Event_Details',
                                );
                          },
                          text: 'Register',
                        );
                },
              );
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                const SizedBox(height: 24),
                Center(
                  child: CachedNetworkImage(
                    height: 261,
                    width: 261,
                    fit: BoxFit.fill,
                    imageUrl: event.poster == ''
                        ? Strings.placeholderImage
                        : event.poster,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  event.name,
                  style: interTextTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${event.startDate.day.toString().padLeft(2, '0')} ${format.format(event.startDate)} | ${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')}',
                      style: interTextTheme.bodyLarge!.copyWith(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        final url =
                            'https://www.google.com/maps/search/?api=1&query=${event.location!.lat},${event.location!.long}';
                        launchUrlString(
                          url,
                          mode: LaunchMode.externalNonBrowserApplication,
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white.withOpacity(0.6),
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            event.location!.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.6),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (description.isEmpty)
                  const Text('')
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: description.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            description[index]['desc'].toString(),
                            style: interTextTheme.bodyLarge!.copyWith(
                              color: AppColors.grey6.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      );
                    },
                  ),
                Text(
                  'Prize: ${event.prizeMoney}',
                  style: interTextTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
