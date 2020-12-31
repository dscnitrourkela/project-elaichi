// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:elaichi/graphql/schema.schema.gql.dart'
    show
        GAccessLevelInputType,
        GCacheControlScope,
        GClubInputType,
        GDateTime,
        GEventInputType,
        GStoryInputType,
        GUpload,
        GUserInputType,
        GVenueInputType;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAccessLevelInputType,
  GCacheControlScope,
  GClubInputType,
  GDateTime,
  GEventInputType,
  GStoryInputType,
  GUpload,
  GUserInputType,
  GVenueInputType
])
final Serializers serializers = _serializersBuilder.build();
