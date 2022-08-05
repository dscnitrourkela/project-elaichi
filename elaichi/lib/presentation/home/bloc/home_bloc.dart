import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elaichi/domain/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const HomeState.initial()) {
    on<_Logout>((event, emit) {
      emit(const HomeState.loading());
      try {
        unawaited(_userRepository.logOut());
        emit(const HomeState.loggedOut());
      } catch (e) {
        emit(HomeState.error(e.toString()));
      }
    });
  }

  final UserRepository _userRepository;
}
