import 'package:bloc/bloc.dart';
import 'package:elaichi/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

/// Cubit for HomePage
class HomeCubit extends Cubit<HomeState> {
  /// Default Constructor for [HomeCubit].
  HomeCubit(this._authenticationRepository) : super(const HomeState.initial());

  final AuthenticationRepository _authenticationRepository;

  ///Page Controller for the home page
  PageController pageController = PageController();

  /// Logs out of the app.
  Future<void> logOut() async {
    emit(const HomeState.loading());
    try {
      await _authenticationRepository.logOut();
      emit(const HomeState.logOut());
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }
}
