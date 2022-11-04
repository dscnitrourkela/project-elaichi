import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/models/org/org.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required List<String> ca,
    required List<String> festID,
    required List<Org> fests,
    String? name,
    String? uid,
    String? photo,
    GenderType? gender,
    DateTime? dob,
    String? state,
    String? city,
    String? college,
    String? stream,
    String? mobile,
    String? selfID,
    String? refferedBy,
    String? rollNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
