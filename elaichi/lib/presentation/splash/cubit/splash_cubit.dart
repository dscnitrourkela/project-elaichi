import 'package:elaichi/domain/exceptions/auth_failure.dart';
import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/domain/repositories/events_repository.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

/// The cubit that handles the [SplashCubit] state.
class SplashCubit extends Cubit<SplashState> {
  /// Default constructor.
  SplashCubit({
    required UserRepository userRepository,
    required EventRepository eventRepository,
  })  : _userRepository = userRepository,
        _eventRepository = eventRepository,
        super(const SplashState.initial());

  final UserRepository _userRepository;
  final EventRepository _eventRepository;

  /// Loads the user data.
  /// This method is called when the [SplashCubit] is initialized.
  Future<void> getCorrectRoute() async {
    emit(const SplashState.loading());
    try {
      final userInfo = await _userRepository.getSignedInUser();
      // ignore: unawaited_futures
      userInfo.fold(
        () {
          emit(const SplashState.unauthenticated());
        },
        (userInput) async {
          await _userRepository.logInToWebMail();
          await _eventRepository.fetchEvents();
          Splash.instance().user = userInput;
          emit(const SplashState.googleAuthenticated());
        },
      );
    } on LogInWithGoogleFailure catch (e) {
      emit(SplashState.error(e.message));
    } catch (e) {
      emit(SplashState.error(e.toString()));
    }
  }
}
