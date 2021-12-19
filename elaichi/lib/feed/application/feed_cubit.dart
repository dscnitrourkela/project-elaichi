import 'package:bloc/bloc.dart';
import 'package:elaichi/auth/domain/datamodel/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'feed_state.dart';
part 'feed_cubit.freezed.dart';

///Cubit for Feed State
class FeedCubit extends Cubit<FeedState> {
  /// Default Constructor for [FeedCubit]
  FeedCubit() : super(const FeedState.initial());

  /// Method to sign in the user as a NIT Rourkela Student
  Future setZimbraAuth(
    String email,
    String password,
  ) async {
    emit(const FeedState.mailunchecked());
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString('email', email);
      await prefs.setString('token', password);
      UserData.instance().email = email;
      UserData.instance().token = password;
      emit(const FeedState.success());
    } catch (e) {
      emit(FeedState.error(e.toString()));
    }
  }

  ///Check whether the user has signedin through zimbra or not
  Future getMailId() async {
    emit(const FeedState.loading());
    try {
      if (UserData.instance().getEmail == null) {
        emit(const FeedState.mailunchecked());
      } else {
        emit(const FeedState.success());
      }
    } catch (e) {
      emit(FeedState.error(e.toString()));
    }
  }
}
