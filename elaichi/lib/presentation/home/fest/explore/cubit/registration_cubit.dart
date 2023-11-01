import 'package:elaichi/domain/models/event/event.dart';
import 'package:elaichi/domain/models/event_registration/event_registration.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_state.dart';
part 'registration_cubit.freezed.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({
    required UserRepository userRepository,
    required EventRepository eventRepository,
  })  : _userRepository = userRepository,
        _eventRepository = eventRepository,
        super(const RegistrationState.initial(eventRegistrations: []));

  List<EventRegistration> eventRegistrations = [];

  Future<void> createEventRegistration({
    required Event event,
    required String page,
  }) async {
    emit(RegistrationState.loading(eventID: event.id));

    final user = _userRepository.user;

    if (user != null) {
      final eventRegistration = await _eventRepository.createEventRegistration(
        eventID: event.id,
        userID: user.id,
      );
      eventRegistration.fold(
        (exception) =>
            emit(RegistrationState.error(error: '${exception.message!} $page')),
        (eventRegistration) async {
          eventRegistration ??= EventRegistration(
            id: 'abc',
            eventID: event.id,
            userID: user.id,
          );
          eventRegistrations.add(eventRegistration);
          emit(const RegistrationState.success());
          emit(
            RegistrationState.initial(
              eventRegistrations: eventRegistrations,
            ),
          );
        },
      );
    } else {
      emit(RegistrationState.error(error: 'User Not Registered $page'));
    }
  }

  Future<void> getEventRegistration({
    required String orgID,
  }) async {
    final user = _userRepository.user;

    if (user != null) {
      final eventRegistrations = await _eventRepository.getEventRegistration(
        orgID: orgID,
        userID: user.id,
      );

      return eventRegistrations.fold(
        (exception) => [],
        (eventRegistrations) => emit(
          RegistrationState.initial(eventRegistrations: eventRegistrations),
        ),
      );
    } else {
      emit(const RegistrationState.initial(eventRegistrations: []));
    }
  }

  final UserRepository _userRepository;
  final EventRepository _eventRepository;
}
