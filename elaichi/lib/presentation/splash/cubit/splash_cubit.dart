import 'package:elaichi/domain/exceptions/auth_failure.dart';
import 'package:elaichi/domain/models/user_model.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

/// The cubit that handles the [SplashCubit] state.
class SplashCubit extends Cubit<SplashState> {
  /// Default constructor.
  SplashCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const SplashState.initial());

  final UserRepository _userRepository;

  /// Loads the user data.
  /// This method is called when the [SplashCubit] is initialized.
  Future<void> getCorrectRoute() async {
    emit(const SplashState.loading());
    try {
      final userInfo = await _userRepository.getSignedInUser();
      userInfo.fold(
        () {
          emit(const SplashState.unauthenticated());
        },
        (userInput) {
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
