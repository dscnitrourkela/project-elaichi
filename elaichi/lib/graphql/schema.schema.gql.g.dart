// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: sort_unnamed_constructors_first
// ignore_for_file: public_member_api_docs
// ignore_for_file: constant_identifier_names
// ignore_for_file: avoid_redundant_argument_values

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GCacheControlScope _$gCacheControlScopePUBLIC =
    const GCacheControlScope._('PUBLIC');
const GCacheControlScope _$gCacheControlScopePRIVATE =
    const GCacheControlScope._('PRIVATE');

GCacheControlScope _$gCacheControlScopeValueOf(String name) {
  switch (name) {
    case 'PUBLIC':
      return _$gCacheControlScopePUBLIC;
    case 'PRIVATE':
      return _$gCacheControlScopePRIVATE;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GCacheControlScope> _$gCacheControlScopeValues =
    new BuiltSet<GCacheControlScope>(const <GCacheControlScope>[
  _$gCacheControlScopePUBLIC,
  _$gCacheControlScopePRIVATE,
]);

Serializer<GAccessLevelInputType> _$gAccessLevelInputTypeSerializer =
    new _$GAccessLevelInputTypeSerializer();
Serializer<GCacheControlScope> _$gCacheControlScopeSerializer =
    new _$GCacheControlScopeSerializer();
Serializer<GClubInputType> _$gClubInputTypeSerializer =
    new _$GClubInputTypeSerializer();
Serializer<GEventInputType> _$gEventInputTypeSerializer =
    new _$GEventInputTypeSerializer();
Serializer<GStoryInputType> _$gStoryInputTypeSerializer =
    new _$GStoryInputTypeSerializer();
Serializer<GUserInputType> _$gUserInputTypeSerializer =
    new _$GUserInputTypeSerializer();
Serializer<GVenueInputType> _$gVenueInputTypeSerializer =
    new _$GVenueInputTypeSerializer();

class _$GAccessLevelInputTypeSerializer
    implements StructuredSerializer<GAccessLevelInputType> {
  @override
  final Iterable<Type> types = const [
    GAccessLevelInputType,
    _$GAccessLevelInputType
  ];
  @override
  final String wireName = 'GAccessLevelInputType';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GAccessLevelInputType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.level != null) {
      result
        ..add('level')
        ..add(serializers.serialize(object.level,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.relation != null) {
      result
        ..add('relation')
        ..add(serializers.serialize(object.relation,
            specifiedType: const FullType(String)));
    }
    if (object.club != null) {
      result
        ..add('club')
        ..add(serializers.serialize(object.club,
            specifiedType: const FullType(String)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GAccessLevelInputType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAccessLevelInputTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'relation':
          result.relation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'club':
          result.club = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GCacheControlScopeSerializer
    implements PrimitiveSerializer<GCacheControlScope> {
  @override
  final Iterable<Type> types = const <Type>[GCacheControlScope];
  @override
  final String wireName = 'GCacheControlScope';

  @override
  Object serialize(Serializers serializers, GCacheControlScope object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GCacheControlScope deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GCacheControlScope.valueOf(serialized as String);
}

class _$GClubInputTypeSerializer
    implements StructuredSerializer<GClubInputType> {
  @override
  final Iterable<Type> types = const [GClubInputType, _$GClubInputType];
  @override
  final String wireName = 'GClubInputType';

  @override
  Iterable<Object> serialize(Serializers serializers, GClubInputType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.clubName != null) {
      result
        ..add('clubName')
        ..add(serializers.serialize(object.clubName,
            specifiedType: const FullType(String)));
    }
    if (object.memberAccess != null) {
      result
        ..add('memberAccess')
        ..add(serializers.serialize(object.memberAccess,
            specifiedType: const FullType(
                BuiltList, const [const FullType(GAccessLevelInputType)])));
    }
    if (object.facAd != null) {
      result
        ..add('facAd')
        ..add(serializers.serialize(object.facAd,
            specifiedType: const FullType(String)));
    }
    if (object.logo != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(object.logo,
            specifiedType: const FullType(String)));
    }
    if (object.events != null) {
      result
        ..add('events')
        ..add(serializers.serialize(object.events,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.society != null) {
      result
        ..add('society')
        ..add(serializers.serialize(object.society,
            specifiedType: const FullType(String)));
    }
    if (object.domain != null) {
      result
        ..add('domain')
        ..add(serializers.serialize(object.domain,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GClubInputType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GClubInputTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'clubName':
          result.clubName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'memberAccess':
          result.memberAccess.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GAccessLevelInputType)]))
              as BuiltList<Object>);
          break;
        case 'facAd':
          result.facAd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'events':
          result.events.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'society':
          result.society = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'domain':
          result.domain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GEventInputTypeSerializer
    implements StructuredSerializer<GEventInputType> {
  @override
  final Iterable<Type> types = const [GEventInputType, _$GEventInputType];
  @override
  final String wireName = 'GEventInputType';

  @override
  Iterable<Object> serialize(Serializers serializers, GEventInputType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.organizer != null) {
      result
        ..add('organizer')
        ..add(serializers.serialize(object.organizer,
            specifiedType: const FullType(String)));
    }
    if (object.eventName != null) {
      result
        ..add('eventName')
        ..add(serializers.serialize(object.eventName,
            specifiedType: const FullType(String)));
    }
    if (object.startDateTime != null) {
      result
        ..add('startDateTime')
        ..add(serializers.serialize(object.startDateTime,
            specifiedType: const FullType(String)));
    }
    if (object.venue != null) {
      result
        ..add('venue')
        ..add(serializers.serialize(object.venue,
            specifiedType: const FullType(String)));
    }
    if (object.endDateTime != null) {
      result
        ..add('endDateTime')
        ..add(serializers.serialize(object.endDateTime,
            specifiedType: const FullType(String)));
    }
    if (object.registrationPrice != null) {
      result
        ..add('registrationPrice')
        ..add(serializers.serialize(object.registrationPrice,
            specifiedType: const FullType(int)));
    }
    if (object.registrationCount != null) {
      result
        ..add('registrationCount')
        ..add(serializers.serialize(object.registrationCount,
            specifiedType: const FullType(int)));
    }
    if (object.otherDescription != null) {
      result
        ..add('otherDescription')
        ..add(serializers.serialize(object.otherDescription,
            specifiedType: const FullType(String)));
    }
    if (object.attendees != null) {
      result
        ..add('attendees')
        ..add(serializers.serialize(object.attendees,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.announcements != null) {
      result
        ..add('announcements')
        ..add(serializers.serialize(object.announcements,
            specifiedType: const FullType(String)));
    }
    if (object.link != null) {
      result
        ..add('link')
        ..add(serializers.serialize(object.link,
            specifiedType: const FullType(String)));
    }
    if (object.picture != null) {
      result
        ..add('picture')
        ..add(serializers.serialize(object.picture,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GEventInputType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GEventInputTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'organizer':
          result.organizer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'eventName':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startDateTime':
          result.startDateTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'venue':
          result.venue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'endDateTime':
          result.endDateTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'registrationPrice':
          result.registrationPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'registrationCount':
          result.registrationCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'otherDescription':
          result.otherDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'attendees':
          result.attendees.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'announcements':
          result.announcements = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'picture':
          result.picture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GStoryInputTypeSerializer
    implements StructuredSerializer<GStoryInputType> {
  @override
  final Iterable<Type> types = const [GStoryInputType, _$GStoryInputType];
  @override
  final String wireName = 'GStoryInputType';

  @override
  Iterable<Object> serialize(Serializers serializers, GStoryInputType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.author != null) {
      result
        ..add('author')
        ..add(serializers.serialize(object.author,
            specifiedType: const FullType(String)));
    }
    if (object.event != null) {
      result
        ..add('event')
        ..add(serializers.serialize(object.event,
            specifiedType: const FullType(String)));
    }
    if (object.asset != null) {
      result
        ..add('asset')
        ..add(serializers.serialize(object.asset,
            specifiedType: const FullType(String)));
    }
    if (object.assetType != null) {
      result
        ..add('assetType')
        ..add(serializers.serialize(object.assetType,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GStoryInputType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GStoryInputTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event':
          result.event = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'asset':
          result.asset = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assetType':
          result.assetType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GUserInputTypeSerializer
    implements StructuredSerializer<GUserInputType> {
  @override
  final Iterable<Type> types = const [GUserInputType, _$GUserInputType];
  @override
  final String wireName = 'GUserInputType';

  @override
  Iterable<Object> serialize(Serializers serializers, GUserInputType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.gmailAuthMail != null) {
      result
        ..add('gmailAuthMail')
        ..add(serializers.serialize(object.gmailAuthMail,
            specifiedType: const FullType(String)));
    }
    if (object.instituteId != null) {
      result
        ..add('instituteId')
        ..add(serializers.serialize(object.instituteId,
            specifiedType: const FullType(String)));
    }
    if (object.mobile != null) {
      result
        ..add('mobile')
        ..add(serializers.serialize(object.mobile,
            specifiedType: const FullType(String)));
    }
    if (object.emergencyContact != null) {
      result
        ..add('emergencyContact')
        ..add(serializers.serialize(object.emergencyContact,
            specifiedType: const FullType(String)));
    }
    if (object.displayPicture != null) {
      result
        ..add('displayPicture')
        ..add(serializers.serialize(object.displayPicture,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GUserInputType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GUserInputTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gmailAuthMail':
          result.gmailAuthMail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instituteId':
          result.instituteId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mobile':
          result.mobile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emergencyContact':
          result.emergencyContact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayPicture':
          result.displayPicture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GVenueInputTypeSerializer
    implements StructuredSerializer<GVenueInputType> {
  @override
  final Iterable<Type> types = const [GVenueInputType, _$GVenueInputType];
  @override
  final String wireName = 'GVenueInputType';

  @override
  Iterable<Object> serialize(Serializers serializers, GVenueInputType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GVenueInputType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GVenueInputTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAccessLevelInputType extends GAccessLevelInputType {
  @override
  final String level;
  @override
  final String name;
  @override
  final String relation;
  @override
  final String club;
  @override
  final String user;

  factory _$GAccessLevelInputType(
          [void Function(GAccessLevelInputTypeBuilder) updates]) =>
      (new GAccessLevelInputTypeBuilder()..update(updates)).build();

  _$GAccessLevelInputType._(
      {this.level, this.name, this.relation, this.club, this.user})
      : super._();

  @override
  GAccessLevelInputType rebuild(
          void Function(GAccessLevelInputTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAccessLevelInputTypeBuilder toBuilder() =>
      new GAccessLevelInputTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAccessLevelInputType &&
        level == other.level &&
        name == other.name &&
        relation == other.relation &&
        club == other.club &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, level.hashCode), name.hashCode), relation.hashCode),
            club.hashCode),
        user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAccessLevelInputType')
          ..add('level', level)
          ..add('name', name)
          ..add('relation', relation)
          ..add('club', club)
          ..add('user', user))
        .toString();
  }
}

class GAccessLevelInputTypeBuilder
    implements Builder<GAccessLevelInputType, GAccessLevelInputTypeBuilder> {
  _$GAccessLevelInputType _$v;

  String _level;
  String get level => _$this._level;
  set level(String level) => _$this._level = level;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _relation;
  String get relation => _$this._relation;
  set relation(String relation) => _$this._relation = relation;

  String _club;
  String get club => _$this._club;
  set club(String club) => _$this._club = club;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  GAccessLevelInputTypeBuilder();

  GAccessLevelInputTypeBuilder get _$this {
    if (_$v != null) {
      _level = _$v.level;
      _name = _$v.name;
      _relation = _$v.relation;
      _club = _$v.club;
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAccessLevelInputType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAccessLevelInputType;
  }

  @override
  void update(void Function(GAccessLevelInputTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAccessLevelInputType build() {
    final _$result = _$v ??
        new _$GAccessLevelInputType._(
            level: level,
            name: name,
            relation: relation,
            club: club,
            user: user);
    replace(_$result);
    return _$result;
  }
}

class _$GClubInputType extends GClubInputType {
  @override
  final String clubName;
  @override
  final BuiltList<GAccessLevelInputType> memberAccess;
  @override
  final String facAd;
  @override
  final String logo;
  @override
  final BuiltList<String> events;
  @override
  final String society;
  @override
  final String domain;

  factory _$GClubInputType([void Function(GClubInputTypeBuilder) updates]) =>
      (new GClubInputTypeBuilder()..update(updates)).build();

  _$GClubInputType._(
      {this.clubName,
      this.memberAccess,
      this.facAd,
      this.logo,
      this.events,
      this.society,
      this.domain})
      : super._();

  @override
  GClubInputType rebuild(void Function(GClubInputTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GClubInputTypeBuilder toBuilder() =>
      new GClubInputTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GClubInputType &&
        clubName == other.clubName &&
        memberAccess == other.memberAccess &&
        facAd == other.facAd &&
        logo == other.logo &&
        events == other.events &&
        society == other.society &&
        domain == other.domain;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, clubName.hashCode), memberAccess.hashCode),
                        facAd.hashCode),
                    logo.hashCode),
                events.hashCode),
            society.hashCode),
        domain.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GClubInputType')
          ..add('clubName', clubName)
          ..add('memberAccess', memberAccess)
          ..add('facAd', facAd)
          ..add('logo', logo)
          ..add('events', events)
          ..add('society', society)
          ..add('domain', domain))
        .toString();
  }
}

class GClubInputTypeBuilder
    implements Builder<GClubInputType, GClubInputTypeBuilder> {
  _$GClubInputType _$v;

  String _clubName;
  String get clubName => _$this._clubName;
  set clubName(String clubName) => _$this._clubName = clubName;

  ListBuilder<GAccessLevelInputType> _memberAccess;
  ListBuilder<GAccessLevelInputType> get memberAccess =>
      _$this._memberAccess ??= new ListBuilder<GAccessLevelInputType>();
  set memberAccess(ListBuilder<GAccessLevelInputType> memberAccess) =>
      _$this._memberAccess = memberAccess;

  String _facAd;
  String get facAd => _$this._facAd;
  set facAd(String facAd) => _$this._facAd = facAd;

  String _logo;
  String get logo => _$this._logo;
  set logo(String logo) => _$this._logo = logo;

  ListBuilder<String> _events;
  ListBuilder<String> get events =>
      _$this._events ??= new ListBuilder<String>();
  set events(ListBuilder<String> events) => _$this._events = events;

  String _society;
  String get society => _$this._society;
  set society(String society) => _$this._society = society;

  String _domain;
  String get domain => _$this._domain;
  set domain(String domain) => _$this._domain = domain;

  GClubInputTypeBuilder();

  GClubInputTypeBuilder get _$this {
    if (_$v != null) {
      _clubName = _$v.clubName;
      _memberAccess = _$v.memberAccess?.toBuilder();
      _facAd = _$v.facAd;
      _logo = _$v.logo;
      _events = _$v.events?.toBuilder();
      _society = _$v.society;
      _domain = _$v.domain;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GClubInputType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GClubInputType;
  }

  @override
  void update(void Function(GClubInputTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GClubInputType build() {
    _$GClubInputType _$result;
    try {
      _$result = _$v ??
          new _$GClubInputType._(
              clubName: clubName,
              memberAccess: _memberAccess?.build(),
              facAd: facAd,
              logo: logo,
              events: _events?.build(),
              society: society,
              domain: domain);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'memberAccess';
        _memberAccess?.build();

        _$failedField = 'events';
        _events?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GClubInputType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GDateTime extends GDateTime {
  @override
  final String value;

  factory _$GDateTime([void Function(GDateTimeBuilder) updates]) =>
      (new GDateTimeBuilder()..update(updates)).build();

  _$GDateTime._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('GDateTime', 'value');
    }
  }

  @override
  GDateTime rebuild(void Function(GDateTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GDateTimeBuilder toBuilder() => new GDateTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GDateTime && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GDateTime')..add('value', value))
        .toString();
  }
}

class GDateTimeBuilder implements Builder<GDateTime, GDateTimeBuilder> {
  _$GDateTime _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  GDateTimeBuilder();

  GDateTimeBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GDateTime other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GDateTime;
  }

  @override
  void update(void Function(GDateTimeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GDateTime build() {
    final _$result = _$v ?? new _$GDateTime._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$GEventInputType extends GEventInputType {
  @override
  final String organizer;
  @override
  final String eventName;
  @override
  final String startDateTime;
  @override
  final String venue;
  @override
  final String endDateTime;
  @override
  final int registrationPrice;
  @override
  final int registrationCount;
  @override
  final String otherDescription;
  @override
  final BuiltList<String> attendees;
  @override
  final String announcements;
  @override
  final String link;
  @override
  final String picture;

  factory _$GEventInputType([void Function(GEventInputTypeBuilder) updates]) =>
      (new GEventInputTypeBuilder()..update(updates)).build();

  _$GEventInputType._(
      {this.organizer,
      this.eventName,
      this.startDateTime,
      this.venue,
      this.endDateTime,
      this.registrationPrice,
      this.registrationCount,
      this.otherDescription,
      this.attendees,
      this.announcements,
      this.link,
      this.picture})
      : super._();

  @override
  GEventInputType rebuild(void Function(GEventInputTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GEventInputTypeBuilder toBuilder() =>
      new GEventInputTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GEventInputType &&
        organizer == other.organizer &&
        eventName == other.eventName &&
        startDateTime == other.startDateTime &&
        venue == other.venue &&
        endDateTime == other.endDateTime &&
        registrationPrice == other.registrationPrice &&
        registrationCount == other.registrationCount &&
        otherDescription == other.otherDescription &&
        attendees == other.attendees &&
        announcements == other.announcements &&
        link == other.link &&
        picture == other.picture;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, organizer.hashCode),
                                                eventName.hashCode),
                                            startDateTime.hashCode),
                                        venue.hashCode),
                                    endDateTime.hashCode),
                                registrationPrice.hashCode),
                            registrationCount.hashCode),
                        otherDescription.hashCode),
                    attendees.hashCode),
                announcements.hashCode),
            link.hashCode),
        picture.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GEventInputType')
          ..add('organizer', organizer)
          ..add('eventName', eventName)
          ..add('startDateTime', startDateTime)
          ..add('venue', venue)
          ..add('endDateTime', endDateTime)
          ..add('registrationPrice', registrationPrice)
          ..add('registrationCount', registrationCount)
          ..add('otherDescription', otherDescription)
          ..add('attendees', attendees)
          ..add('announcements', announcements)
          ..add('link', link)
          ..add('picture', picture))
        .toString();
  }
}

class GEventInputTypeBuilder
    implements Builder<GEventInputType, GEventInputTypeBuilder> {
  _$GEventInputType _$v;

  String _organizer;
  String get organizer => _$this._organizer;
  set organizer(String organizer) => _$this._organizer = organizer;

  String _eventName;
  String get eventName => _$this._eventName;
  set eventName(String eventName) => _$this._eventName = eventName;

  String _startDateTime;
  String get startDateTime => _$this._startDateTime;
  set startDateTime(String startDateTime) =>
      _$this._startDateTime = startDateTime;

  String _venue;
  String get venue => _$this._venue;
  set venue(String venue) => _$this._venue = venue;

  String _endDateTime;
  String get endDateTime => _$this._endDateTime;
  set endDateTime(String endDateTime) => _$this._endDateTime = endDateTime;

  int _registrationPrice;
  int get registrationPrice => _$this._registrationPrice;
  set registrationPrice(int registrationPrice) =>
      _$this._registrationPrice = registrationPrice;

  int _registrationCount;
  int get registrationCount => _$this._registrationCount;
  set registrationCount(int registrationCount) =>
      _$this._registrationCount = registrationCount;

  String _otherDescription;
  String get otherDescription => _$this._otherDescription;
  set otherDescription(String otherDescription) =>
      _$this._otherDescription = otherDescription;

  ListBuilder<String> _attendees;
  ListBuilder<String> get attendees =>
      _$this._attendees ??= new ListBuilder<String>();
  set attendees(ListBuilder<String> attendees) => _$this._attendees = attendees;

  String _announcements;
  String get announcements => _$this._announcements;
  set announcements(String announcements) =>
      _$this._announcements = announcements;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  String _picture;
  String get picture => _$this._picture;
  set picture(String picture) => _$this._picture = picture;

  GEventInputTypeBuilder();

  GEventInputTypeBuilder get _$this {
    if (_$v != null) {
      _organizer = _$v.organizer;
      _eventName = _$v.eventName;
      _startDateTime = _$v.startDateTime;
      _venue = _$v.venue;
      _endDateTime = _$v.endDateTime;
      _registrationPrice = _$v.registrationPrice;
      _registrationCount = _$v.registrationCount;
      _otherDescription = _$v.otherDescription;
      _attendees = _$v.attendees?.toBuilder();
      _announcements = _$v.announcements;
      _link = _$v.link;
      _picture = _$v.picture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GEventInputType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GEventInputType;
  }

  @override
  void update(void Function(GEventInputTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GEventInputType build() {
    _$GEventInputType _$result;
    try {
      _$result = _$v ??
          new _$GEventInputType._(
              organizer: organizer,
              eventName: eventName,
              startDateTime: startDateTime,
              venue: venue,
              endDateTime: endDateTime,
              registrationPrice: registrationPrice,
              registrationCount: registrationCount,
              otherDescription: otherDescription,
              attendees: _attendees?.build(),
              announcements: announcements,
              link: link,
              picture: picture);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'attendees';
        _attendees?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GEventInputType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GStoryInputType extends GStoryInputType {
  @override
  final String author;
  @override
  final String event;
  @override
  final String asset;
  @override
  final String assetType;
  @override
  final String description;

  factory _$GStoryInputType([void Function(GStoryInputTypeBuilder) updates]) =>
      (new GStoryInputTypeBuilder()..update(updates)).build();

  _$GStoryInputType._(
      {this.author, this.event, this.asset, this.assetType, this.description})
      : super._();

  @override
  GStoryInputType rebuild(void Function(GStoryInputTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GStoryInputTypeBuilder toBuilder() =>
      new GStoryInputTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GStoryInputType &&
        author == other.author &&
        event == other.event &&
        asset == other.asset &&
        assetType == other.assetType &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, author.hashCode), event.hashCode), asset.hashCode),
            assetType.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GStoryInputType')
          ..add('author', author)
          ..add('event', event)
          ..add('asset', asset)
          ..add('assetType', assetType)
          ..add('description', description))
        .toString();
  }
}

class GStoryInputTypeBuilder
    implements Builder<GStoryInputType, GStoryInputTypeBuilder> {
  _$GStoryInputType _$v;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _event;
  String get event => _$this._event;
  set event(String event) => _$this._event = event;

  String _asset;
  String get asset => _$this._asset;
  set asset(String asset) => _$this._asset = asset;

  String _assetType;
  String get assetType => _$this._assetType;
  set assetType(String assetType) => _$this._assetType = assetType;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  GStoryInputTypeBuilder();

  GStoryInputTypeBuilder get _$this {
    if (_$v != null) {
      _author = _$v.author;
      _event = _$v.event;
      _asset = _$v.asset;
      _assetType = _$v.assetType;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GStoryInputType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GStoryInputType;
  }

  @override
  void update(void Function(GStoryInputTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GStoryInputType build() {
    final _$result = _$v ??
        new _$GStoryInputType._(
            author: author,
            event: event,
            asset: asset,
            assetType: assetType,
            description: description);
    replace(_$result);
    return _$result;
  }
}

class _$GUpload extends GUpload {
  @override
  final String value;

  factory _$GUpload([void Function(GUploadBuilder) updates]) =>
      (new GUploadBuilder()..update(updates)).build();

  _$GUpload._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('GUpload', 'value');
    }
  }

  @override
  GUpload rebuild(void Function(GUploadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUploadBuilder toBuilder() => new GUploadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUpload && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUpload')..add('value', value))
        .toString();
  }
}

class GUploadBuilder implements Builder<GUpload, GUploadBuilder> {
  _$GUpload _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  GUploadBuilder();

  GUploadBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUpload other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUpload;
  }

  @override
  void update(void Function(GUploadBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUpload build() {
    final _$result = _$v ?? new _$GUpload._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$GUserInputType extends GUserInputType {
  @override
  final String name;
  @override
  final String username;
  @override
  final String gmailAuthMail;
  @override
  final String instituteId;
  @override
  final String mobile;
  @override
  final String emergencyContact;
  @override
  final String displayPicture;

  factory _$GUserInputType([void Function(GUserInputTypeBuilder) updates]) =>
      (new GUserInputTypeBuilder()..update(updates)).build();

  _$GUserInputType._(
      {this.name,
      this.username,
      this.gmailAuthMail,
      this.instituteId,
      this.mobile,
      this.emergencyContact,
      this.displayPicture})
      : super._();

  @override
  GUserInputType rebuild(void Function(GUserInputTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserInputTypeBuilder toBuilder() =>
      new GUserInputTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserInputType &&
        name == other.name &&
        username == other.username &&
        gmailAuthMail == other.gmailAuthMail &&
        instituteId == other.instituteId &&
        mobile == other.mobile &&
        emergencyContact == other.emergencyContact &&
        displayPicture == other.displayPicture;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, name.hashCode), username.hashCode),
                        gmailAuthMail.hashCode),
                    instituteId.hashCode),
                mobile.hashCode),
            emergencyContact.hashCode),
        displayPicture.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GUserInputType')
          ..add('name', name)
          ..add('username', username)
          ..add('gmailAuthMail', gmailAuthMail)
          ..add('instituteId', instituteId)
          ..add('mobile', mobile)
          ..add('emergencyContact', emergencyContact)
          ..add('displayPicture', displayPicture))
        .toString();
  }
}

class GUserInputTypeBuilder
    implements Builder<GUserInputType, GUserInputTypeBuilder> {
  _$GUserInputType _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _gmailAuthMail;
  String get gmailAuthMail => _$this._gmailAuthMail;
  set gmailAuthMail(String gmailAuthMail) =>
      _$this._gmailAuthMail = gmailAuthMail;

  String _instituteId;
  String get instituteId => _$this._instituteId;
  set instituteId(String instituteId) => _$this._instituteId = instituteId;

  String _mobile;
  String get mobile => _$this._mobile;
  set mobile(String mobile) => _$this._mobile = mobile;

  String _emergencyContact;
  String get emergencyContact => _$this._emergencyContact;
  set emergencyContact(String emergencyContact) =>
      _$this._emergencyContact = emergencyContact;

  String _displayPicture;
  String get displayPicture => _$this._displayPicture;
  set displayPicture(String displayPicture) =>
      _$this._displayPicture = displayPicture;

  GUserInputTypeBuilder();

  GUserInputTypeBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _username = _$v.username;
      _gmailAuthMail = _$v.gmailAuthMail;
      _instituteId = _$v.instituteId;
      _mobile = _$v.mobile;
      _emergencyContact = _$v.emergencyContact;
      _displayPicture = _$v.displayPicture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GUserInputType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUserInputType;
  }

  @override
  void update(void Function(GUserInputTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserInputType build() {
    final _$result = _$v ??
        new _$GUserInputType._(
            name: name,
            username: username,
            gmailAuthMail: gmailAuthMail,
            instituteId: instituteId,
            mobile: mobile,
            emergencyContact: emergencyContact,
            displayPicture: displayPicture);
    replace(_$result);
    return _$result;
  }
}

class _$GVenueInputType extends GVenueInputType {
  @override
  final String name;
  @override
  final String description;

  factory _$GVenueInputType([void Function(GVenueInputTypeBuilder) updates]) =>
      (new GVenueInputTypeBuilder()..update(updates)).build();

  _$GVenueInputType._({this.name, this.description}) : super._();

  @override
  GVenueInputType rebuild(void Function(GVenueInputTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GVenueInputTypeBuilder toBuilder() =>
      new GVenueInputTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GVenueInputType &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GVenueInputType')
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class GVenueInputTypeBuilder
    implements Builder<GVenueInputType, GVenueInputTypeBuilder> {
  _$GVenueInputType _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  GVenueInputTypeBuilder();

  GVenueInputTypeBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GVenueInputType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GVenueInputType;
  }

  @override
  void update(void Function(GVenueInputTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GVenueInputType build() {
    final _$result =
        _$v ?? new _$GVenueInputType._(name: name, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
