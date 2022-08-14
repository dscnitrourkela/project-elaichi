part of 'feed_cubit.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.initial() = _Initial;

  const factory FeedState.loading() = _Loading;

  const factory FeedState.webMailAuthenticated() = _WebMailAuthenticated;

  const factory FeedState.webMailUnauthenticated() = _WebMailUnauthenticated;
}
