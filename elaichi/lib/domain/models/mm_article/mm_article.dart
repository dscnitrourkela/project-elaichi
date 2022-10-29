import 'package:freezed_annotation/freezed_annotation.dart';

part 'mm_article.freezed.dart';
part 'mm_article.g.dart';

@freezed
class MMArticle with _$MMArticle {
  const factory MMArticle({
    required String id,
    required String title,
    required String imageUrl,
  }) = _MMArticle;

  factory MMArticle.fromJson(Map<String, dynamic> json) =>
      _$MMArticleFromJson(json);
}
