import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const HomeState.initial());

  bool isVerified = false;

  void checkIfVerified() {
    if (_userRepository.rollNumber != null) {
      isVerified = true;
    } else {
      isVerified = false;
    }
  }

  final UserRepository _userRepository;
}
