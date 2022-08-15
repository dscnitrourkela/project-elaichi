import 'package:bloc/bloc.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.dart';
part 'feed_cubit.freezed.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const FeedState.initial()) {
    getZimraLoginStatus();
  }

  late final UserRepository _userRepository;

  void getZimraLoginStatus() {
    emit(const FeedState.loading());
    if (_userRepository.rollNumber != null) {
      emit(const FeedState.webMailAuthenticated());
    } else {
      emit(const FeedState.webMailUnauthenticated());
    }
  }
}
