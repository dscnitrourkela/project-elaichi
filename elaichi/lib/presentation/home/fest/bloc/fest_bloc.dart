import 'dart:convert';

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
            final status = isVerified();

            final fests = await _eventRepository.getFests();

            await fests.fold(
              (exception) {
                debugPrint(exception.toString());
                emit(FestState.error(error: exception.message!));
              },
              (fests) async {
                final events = await _eventRepository.getEvents(fests[0].id);

                events.fold(
                  (exception) =>
                      emit(FestState.error(error: exception.message!)),
                  (r) => r,
                );

                final categorisedEvents =
                    _eventRepository.getCategorisedEvents();

                emit(
                  FestState.initial(
                    webMailState: status
                        ? WebMailState.authenticated
                        : WebMailState.unAuthenticated,
                    fests: fests,
                    categorisedEvents: categorisedEvents,
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

  Map<String, List<Event>> getCalender(List<Event> events) {
    final map = <String, List<Event>>{};

    events.sort(
      (a, b) => a.startDate.compareTo(b.startDate),
    );

    final format = DateFormat('MMM');
    for (final element in events) {
      if (map.keys.contains(
          '${element.startDate.day} ${format.format(element.startDate)}')) {
        map['${element.startDate.day} ${format.format(element.startDate)}']!
            .add(element);
      } else {
        map['${element.startDate.day} ${format.format(element.startDate)}'] = [
          element
        ];
      }
    }
    return map;
  }
}
