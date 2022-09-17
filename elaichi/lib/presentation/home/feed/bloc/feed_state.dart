part of 'feed_bloc.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.loading() = _Loading;

  const factory FeedState.success({
    required WebMailState webMailState,
    @Default([]) List<MMArticle> data,
  }) = _Success;

  const factory FeedState.error(String error) = _Error;
}

enum WebMailState {
  authenticated,
  unAuthenticated,
}
