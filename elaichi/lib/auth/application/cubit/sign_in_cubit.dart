import 'package:bloc/bloc.dart';
import 'package:elaichi/auth/domain/repository/auth_failure.dart';
import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

/// Cubit for SignIn feature.
class SignInCubit extends Cubit<SignInState> {
  /// Default constructor of [SignInCubit].
  SignInCubit(this._authenticationRepository)
      : super(const SignInState.initial());

  final AuthenticationRepository _authenticationRepository;

  /// Signs in with google and manipulates the state.
  Future<void> signInWithGoogle() async {
    emit(const SignInState.loading());
    try {
      await _authenticationRepository.signInWithGoogle();
      emit(const SignInState.success());
    } on LogInWithGoogleFailure catch (e) {
      emit(SignInState.error(e.message));
    } catch (_) {
      emit(SignInState.error(_.toString()));
    }
  }
}
