import 'dart:async';

import 'package:elaichi/domain/exceptions/auth_failure.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

/// The cubit that handles the [SplashCubit] state.
class SplashCubit extends Cubit<SplashState> {
  /// Default constructor.
  SplashCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const SplashState.loading());

  final UserRepository _userRepository;
  late final StreamSubscription<User?> _userSubscription;
  int count = 0;

  /// Loads the user data.
  /// This method is called when the [SplashCubit] is initialized.
  Future<void> getCorrectRoute() async {
    try {
      _userSubscription =
          _userRepository.firebaseAuthStream.listen((firebaseUser) async {
        if (firebaseUser == null) {
          emit(const SplashState.unauthenticated());
        } else {
          final token = await firebaseUser.getIdToken();
          await _userRepository.googleAuthenticated(token);
          emit(const SplashState.googleAuthenticated());
        }
      });
    } on LogInWithGoogleFailure catch (e) {
      emit(SplashState.error(e.message));
    } catch (e) {
      emit(SplashState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
