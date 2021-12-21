import 'package:elaichi/auth/domain/datamodel/user_model.dart';
import 'package:elaichi/auth/domain/repository/auth_failure.dart';
import 'package:elaichi/auth/domain/repository/auth_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_data_state.dart';
part 'user_data_cubit.freezed.dart';

/// The cubit that handles the [UserDataCubit] state.
class UserDataCubit extends Cubit<UserDataState> {
  /// Default constructor.
  UserDataCubit(this._authenticationRepository)
      : super(const UserDataState.initial());

  final AuthenticationRepository _authenticationRepository;

  /// Loads the user data.
  /// This method is called when the [UserDataCubit] is initialized.
  Future<void> getCorrectRoute() async {
    emit(const UserDataState.loading());
    try {
      final userInfo = await _authenticationRepository.getSignedInUser();
      final prefs = await SharedPreferences.getInstance();
      userInfo.fold(
        () {
          emit(const UserDataState.unauthenticated());
        },
        (userObject) {
          UserData.instance().user = userObject;
          UserData.instance().rollNumber =
              (prefs.getString('rollNumber') != null)
                  ? prefs.getString('rollNumber')
                  : null;
          UserData.instance().token = (prefs.getString('token') != null)
              ? prefs.getString('token')
              : null;
          emit(const UserDataState.googleAuthenticated());
        },
      );
    } on LogInWithGoogleFailure catch (e) {
      emit(UserDataState.error(e.message));
    } catch (e) {
      emit(UserDataState.error(e.toString()));
    }
  }
}
