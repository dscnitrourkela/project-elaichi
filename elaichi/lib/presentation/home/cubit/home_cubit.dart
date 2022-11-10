import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:elaichi/presentation/core/utils/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const HomeState.loading());

  void checkIfVerified({int? pageIndex}) {
    if (_userRepository.rollNumber != null) {
      emit(HomeState.isVerifiedUser(pageIndex ?? 1));
    } else if (_userRepository.user != null) {
      emit(HomeState.isRegisteredUser(pageIndex ?? 0));
    } else {
      emit(const HomeState.initial());
    }
  }

  String get userImage =>
      _userRepository.firebaseUser.photoURL ?? Strings.placeholderImage;

  final UserRepository _userRepository;
}
