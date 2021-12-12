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

  ///integer concerning the corect state of page variable
  int pageIndex = 0;

  ///Page Controller for the home page
  PageController pageController = PageController();

  /// Change state on click of the bottom nav bar
  /// index is the index of the bottom nav bar
  void bottomNavBarClicked() {
    switch (pageIndex) {
      case 0:
        emit(const HomeState.feedPage());
        break;
      case 1:
        emit(const HomeState.browsePage());
        break;
      case 2:
        emit(const HomeState.emailPage());
        break;
      case 3:
        emit(const HomeState.profilePage());
        break;
      default:
        emit(const HomeState.feedPage());
        break;
    }
  }

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
