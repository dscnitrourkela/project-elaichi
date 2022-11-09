part of 'all_events_cubit.dart';

@freezed
class AllEventsState with _$AllEventsState {
  const factory AllEventsState.initial({@Default(0) int selectedIndex}) =
      _Initial;

  const factory AllEventsState.loading() = _Loading;
}
