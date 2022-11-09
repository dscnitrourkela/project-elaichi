import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/models/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org.freezed.dart';
part 'org.g.dart';

@freezed
class Org with _$Org {
  const factory Org({
    required String id,
    required String name,
    required String logo,
    required OrgType orgType,
    required OrgSubType orgSubType,
    required StatusType status,
    required int registrationFee,
    required String description,
    DateTime? startDate,
    DateTime? endDate,
    String? tagline,
    String? theme,
    String? locationID,
    String? coverImg,
    Location? location,
    String? festID,
    Org? fest,
  }) = _Org;

  factory Org.fromJson(Map<String, dynamic> json) => _$OrgFromJson(json);
}
