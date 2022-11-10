import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'fest_event.dart';
part 'fest_state.dart';
part 'fest_bloc.freezed.dart';

class FestBloc extends Bloc<FestEvent, FestState> {
  FestBloc({
    required EventRepository eventRepository,
    required UserRepository userRepository,
  })  : _eventRepository = eventRepository,
        _userRepository = userRepository,
        super(const _Loading()) {
    on<FestEvent>(
      (event, emit) async {
        await event.when(
          started: () async {
            final status = isRegistered();

            final fests = await _eventRepository.getFests();

            await fests.fold(
              (exception) {
                debugPrint(exception.toString());
                emit(FestState.error(error: exception.message!));
              },
              (fests) async {
                emit(
                  FestState.initial(
                    webMailState: status
                        ? WebMailState.authenticated
                        : WebMailState.unAuthenticated,
                    fests: fests,
                  ),
                );
              },
            );
          },
          webMailLogIn: () {
            final status = isRegistered();
            emit(
              (state as _Initial).copyWith(
                webMailState: status
                    ? WebMailState.authenticated
                    : WebMailState.unAuthenticated,
              ),
            );
          },
          // createEventRegistration: (eventID) async {
          //   final eventRegistration =
          //       await eventRepository.createEventRegistration(
          //     eventID: eventID,
          //     userID: _userRepository.user!.id,
          //   );

          //   eventRegistration.fold(
          //     (exception) => debugPrint(exception.toString()),
          //     (eventRegistration) => null,
          //   );
          // },
        );
      },
    );
  }

  late final EventRepository _eventRepository;
  late final UserRepository _userRepository;

  bool isRegistered() {
    if (_userRepository.rollNumber != null || _userRepository.user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, Map<String, List<Event>>>> getCalenderAndCategorisedEvents(
    String orgID,
  ) async {
    final getEvents = await _eventRepository.getEvents(orgID: orgID);

    return getEvents.fold(
      (exception) => {},
      (events) {
        final calender = _eventRepository.getCalender(events);
        final getCategorisedEvents =
            _eventRepository.getCategorisedEvents(events);
        getCategorisedEvents['ALL'] = events;
        return {
          'calender': calender,
          'categorisedEvents': getCategorisedEvents,
        };
      },
    );
  }

  String durationString(DateTime? startDate, DateTime? endDate) {
    final format1 = DateFormat('MMM');
    if (startDate != null && endDate != null) {
      return '${format1.format(startDate)} ${startDate.day.toString().padLeft(2, '0')} - ${format1.format(endDate)} ${endDate.day.toString().padLeft(2, '0')} ${endDate.year}';
    } else {
      return '';
    }
  }
}
