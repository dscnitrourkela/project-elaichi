import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
            final status = isVerified();

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
            final status = isVerified();
            emit(
              (state as _Initial).copyWith(
                webMailState: status
                    ? WebMailState.authenticated
                    : WebMailState.unAuthenticated,
              ),
            );
          },
        );
      },
    );
  }

  late final EventRepository _eventRepository;
  late final UserRepository _userRepository;

  bool isVerified() {
    if (_userRepository.rollNumber != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, Map<String, List<Event>>>> getCalenderAndCategorisedEvents(
    String orgID,
  ) async {
    final getEvents = await _eventRepository.getEvents(orgID);

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
}
