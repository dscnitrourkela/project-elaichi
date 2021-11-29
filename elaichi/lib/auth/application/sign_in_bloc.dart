import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elaichi/auth/domain/auth_failure.dart';
import 'package:elaichi/auth/domain/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

// ignore: comment_references
/// A bloc that manages the [SignInPage] view.
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  /// Constructor for [SignInBloc]
  SignInBloc(SignInState initialState, this._authFacade) : super(initialState);

  final IAuthFacade _authFacade;

  /// A function that maps all the events with the state of the bloc.
  Stream<SignInState> mapEventtoState(SignInEvent event) async* {
    yield* event.map(
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },
    );
  }
}
