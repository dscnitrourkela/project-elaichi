import 'package:elaichi/domain/models/org/org.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String image,
    required Org org,
    required String orgID,
    String? linkTo,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
