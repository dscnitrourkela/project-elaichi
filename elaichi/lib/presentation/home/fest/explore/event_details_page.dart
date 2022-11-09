import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/back_button.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/explore/cubit/registration_cubit.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EventDetailsPage extends StatelessWidget {
  EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  final toastUtil = ToastUtil.getInstance();
  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM');

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: RegisterBottomBar(
          child: BlocConsumer<RegistrationCubit, RegistrationState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  toastUtil.showToast(
                    mode: ToastMode.Success,
                    title: 'Successfully Registered for the event',
                  );
                },
                error: (error) => toastUtil.showToast(
                  mode: ToastMode.Error,
                  title: error,
                ),
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
                      ? const Text('Registered')
                      : YellowFlatButton(
                          onTapped: () async {
                            await context
                                .read<RegistrationCubit>()
                                .createEventRegistration(
                                  event: event,
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
                  jsonDecode(event.name)['heading'].toString(),
                  style: interTextTheme.subtitle2!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${event.startDate.day.toString().padLeft(2, '0')} ${format.format(event.startDate)} | ${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')}',
                  style: interTextTheme.bodyText1!.copyWith(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  jsonDecode(event.description)[0]['desc'].toString(),
                  style: interTextTheme.bodyText1!
                      .copyWith(color: AppColors.grey6.withOpacity(0.8)),
                ),
                const SizedBox(height: 24),
                Text(
                  'Prize: ${jsonDecode(event.name)['prizeAmount'].toString()}',
                  style: interTextTheme.bodyText1!.copyWith(
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
