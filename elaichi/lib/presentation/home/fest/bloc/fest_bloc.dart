import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    on<FestEvent>((event, emit) {
      event.when(
        started: () {
          final status = getZimraLoginStatus();
          emit(
            FestState.initial(
              webMailState: status
                  ? WebMailState.authenticated
                  : WebMailState.unAuthenticated,
            ),
          );
        },
        webMailLogIn: () {
          final status = getZimraLoginStatus();
          emit(
            FestState.initial(
              webMailState: status
                  ? WebMailState.authenticated
                  : WebMailState.unAuthenticated,
            ),
          );
        },
      );
    });
  }

  late final EventRepository _eventRepository;
  late final UserRepository _userRepository;

  bool getZimraLoginStatus() {
    if (_userRepository.rollNumber != null) {
      return true;
    } else {
      return false;
    }
  }
}
