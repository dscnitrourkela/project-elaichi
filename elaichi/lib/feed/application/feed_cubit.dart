import 'package:bloc/bloc.dart';
import 'package:elaichi/auth/domain/datamodel/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.dart';
part 'feed_cubit.freezed.dart';

///Cubit for Feed State
class FeedCubit extends Cubit<FeedState> {
  /// Default Constructor for [FeedCubit]
  FeedCubit() : super(const FeedState.initial());

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
