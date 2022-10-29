part of 'feed_bloc.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.loading() = _Loading;

  const factory FeedState.initial({
    required WebMailState webMailState,
    @Default([]) List<MMArticle> articles,
  }) = _Initial;

  const factory FeedState.error(String error) = _Error;
}

enum WebMailState {
  authenticated,
  unAuthenticated,
}
