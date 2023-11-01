import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/presentation/components/buttons/yellow_buttons.dart';
import 'package:elaichi/presentation/components/toasts/toast_util.dart';
import 'package:elaichi/presentation/core/router/app_router.dart';
import 'package:elaichi/presentation/core/theme/base_theme.dart';
import 'package:elaichi/presentation/core/theme/colors.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:elaichi/presentation/home/fest/explore/cubit/registration_cubit.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/duration_dates.dart';
import 'package:elaichi/presentation/home/fest/explore/widgets/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SpeakerEventCard extends StatelessWidget {
  SpeakerEventCard({
    super.key,
    required this.event,
  });

  final Event event;

  final toastUtil = ToastUtil.getInstance();

  @override
  Widget build(BuildContext context) {
    final format1 = DateFormat('MMM');
    final duration =
        '${format1.format(event.startDate)} ${event.startDate.day.toString().padLeft(2, '0')} - ${format1.format(event.endDate)} ${event.endDate.day.toString().padLeft(2, '0')} ${event.endDate.year}';
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.eventDetails,
        arguments: {'event': event},
      ),
      child: SizedBox(
        width: 220,
        height: 358,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 184,
                child: Container(
                  height: 160,
                  width: 160,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: event.poster == ''
                          ? const NetworkImage(
                              Strings.placeholderImage,
                            )
                          : NetworkImage(event.poster),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 29,
                child: ScrollingText(
                  text: event.name,
                  style: interTextTheme.titleSmall!.copyWith(
                    color: Colors.black,
                  ),
                  condition: 10,
                ),
              ),
              const SizedBox(height: 4),
              // SizedBox(
              //   height: 17,
              //   child: Text(
              //     '',
              //     style: interTextTheme.bodyText1!.copyWith(
              //       color: Colors.black.withOpacity(0.6),
              //       fontSize: 13,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16),
              Divider(
                thickness: 1,
                height: 1,
                color: AppColors.grey12.withOpacity(0.2),
              ),
              const SizedBox(height: 16),
              // SizedBox(
              //   height: 19,
              //   child: ScrollingText(
              //     text: '',
              //     style: interTextTheme.subtitle2!.copyWith(
              //       height: 1.18,
              //       fontSize: 16,
              //       color: Colors.black,
              //     ),
              //     condition: 24,
              //   ),
              // ),
              const SizedBox(height: 4),
              SizedBox(
                height: 28,
                child: DurationDates(
                  iconSize: 18,
                  text: duration,
                  color: Colors.black.withOpacity(0.6),
                  style: interTextTheme.bodySmall!.copyWith(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 240,
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 2),
                    BlocConsumer<RegistrationCubit, RegistrationState>(
                      bloc: context.read<RegistrationCubit>(),
                      listener: (context, state) {
                        state.whenOrNull(
                          error: (error) {
                            if (error == 'User Not Registered Speaker') {
                              launchUrlString(
                                'https://inno.nitrkl.in/',
                                mode: LaunchMode.externalApplication,
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
                                ? const Text('Registered')
                                : YellowFlatButton(
                                    onTapped: () async {
                                      await context
                                          .read<RegistrationCubit>()
                                          .createEventRegistration(
                                            event: event,
                                            page: 'Speaker',
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
                                    page: 'Speaker',
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
                                            page: 'Speaker',
                                          );
                                    },
                                    text: 'Register',
                                    width: 105,
                                  );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
