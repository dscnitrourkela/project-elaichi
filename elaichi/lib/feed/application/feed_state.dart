part of 'feed_cubit.dart';

/// Defines all the states of home page.
@freezed
class FeedState with _$FeedState {
  /// Initial state of feed page.
  const factory FeedState.initial() = _Initial;

  /// Loading state of feed page.
  const factory FeedState.loading() = _Loading;

  /// Success state of feed page.
  const factory FeedState.success() = _Success;

  /// NITR Student State
  const factory FeedState.mailunchecked() = _MailUnChecked;

  /// Error state of feed page.
  const factory FeedState.error(String error) = _Error;
}
