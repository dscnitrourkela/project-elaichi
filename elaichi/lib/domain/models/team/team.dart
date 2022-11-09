import 'package:elaichi/domain/models/org/org.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const factory Team({
    required String id,
    required String orgID,
    required Org org,
    required User user,
    required String userID,
    String? team,
    int? priority,
    String? position,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
