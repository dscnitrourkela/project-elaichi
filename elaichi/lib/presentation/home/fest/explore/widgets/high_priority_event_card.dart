import 'dart:convert';

import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/sizeconfig.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/explore/cubit/registration_cubit.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HighPriorityEventCard extends StatelessWidget {
  HighPriorityEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;
  final toastUtil = ToastUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM');
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.eventDetails,
        arguments: {'event': event},
      ),
      child: SizedBox(
        width: 264,
        height: 466,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    onError: (exception, stackTrace) => const NetworkImage(
                      Strings.placeholderImage,
                    ),
                    image: event.poster == ''
                        ? const NetworkImage(
                            Strings.placeholderImage,
                          )
                        : NetworkImage(event.poster),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 29,
                      width: 240,
                      child: ScrollingText(
                        text: jsonDecode(event.name)['heading'].toString(),
                        style: interTextTheme.subtitle2!.copyWith(
                          color: Colors.black,
                        ),
                        condition: 28,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 17,
                      child: Text(
                        '${event.startDate.day.toString().padLeft(2, '0')} ${format.format(event.startDate)} | ${event.startDate.hour.toString().padLeft(2, '0')}:${event.startDate.minute.toString().padLeft(2, '0')}',
                        style: interTextTheme.bodyText1!.copyWith(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 14,
                          height: 1.19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 95,
                      child: Text(
                        jsonDecode(event.description)[0]['desc'].toString(),
                        style: interTextTheme.bodyText1!.copyWith(
                          height: 1.18,
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: AppColors.grey12.withOpacity(0.2),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 240,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (jsonDecode(event.name)['prizeAmount'] != null &&
                              jsonDecode(event.name)['prizeAmount'] != '')
                            SizedBox(
                              width: 116,
                              height: 22,
                              child: ScrollingText(
                                text:
                                    'Prize: ${jsonDecode(event.name)['prizeAmount'].toString()}',
                                style: interTextTheme.bodyText1!.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                condition: 23,
                              ),
                            ),
                          const SizedBox(width: 2),
                          BlocConsumer<RegistrationCubit, RegistrationState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                success: () {
                                  toastUtil.showToast(
                                    mode: ToastMode.Success,
                                    title:
                                        'Successfully Registered for the event',
                                  );
                                },
                                error: (error) {
                                  if (error == 'User Not Registered') {
                                    Navigator.pushNamed(
                                      context,
                                      AppRouter.registration,
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
                                            (element) =>
                                                event.id == element.eventID,
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
                                          width: 105,
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
                                  width: 105,
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
                                          width: 105,
                                        );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
