part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.isVerifiedUser(int pageIndex) = _IsVerifiedUser;

  const factory HomeState.isRegisteredUser(int pageIndex) = _IsRegisteredUser;
}
