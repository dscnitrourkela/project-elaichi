part of 'fest_bloc.dart';

@freezed
class FestState with _$FestState {
  const factory FestState.initial({required WebMailState webMailState}) =
      _Initial;

  const factory FestState.loading() = _Loading;
}
