import 'package:elaichi/domain/exceptions/auth_failure.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

/// Cubit for SignIn feature.
class SignInCubit extends Cubit<SignInState> {
  /// Default constructor of [SignInCubit].
  SignInCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const SignInState.initial());

  final UserRepository _userRepository;

  /// Signs in with google and manipulates the state.
  Future<void> signInWithGoogle() async {
    emit(const SignInState.loading());

    try {
      await _userRepository.signInWithGoogle();
      emit(const SignInState.success());
    } on LogInWithGoogleFailure catch (e) {
      emit(SignInState.error(e.message));
    } catch (e) {
      emit(SignInState.error(e.toString()));
    }
  }
}
