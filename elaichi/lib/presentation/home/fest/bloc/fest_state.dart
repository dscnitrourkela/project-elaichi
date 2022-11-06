part of 'fest_bloc.dart';

@freezed
class FestState with _$FestState {
  const factory FestState.initial({
    required WebMailState webMailState,
    required List<Org> fests,
  }) = _Initial;

  const factory FestState.loading() = _Loading;

  const factory FestState.error({required String error}) = _Error;
}
