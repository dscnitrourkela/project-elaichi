// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mm_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MMArticle _$MMArticleFromJson(Map<String, dynamic> json) {
  return _MMArticle.fromJson(json);
}

/// @nodoc
mixin _$MMArticle {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MMArticleCopyWith<MMArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MMArticleCopyWith<$Res> {
  factory $MMArticleCopyWith(MMArticle value, $Res Function(MMArticle) then) =
      _$MMArticleCopyWithImpl<$Res>;
  $Res call({String id, String title, String imageUrl});
}

/// @nodoc
class _$MMArticleCopyWithImpl<$Res> implements $MMArticleCopyWith<$Res> {
  _$MMArticleCopyWithImpl(this._value, this._then);

  final MMArticle _value;
  // ignore: unused_field
  final $Res Function(MMArticle) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MMArticleCopyWith<$Res> implements $MMArticleCopyWith<$Res> {
  factory _$$_MMArticleCopyWith(
          _$_MMArticle value, $Res Function(_$_MMArticle) then) =
      __$$_MMArticleCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String imageUrl});
}

/// @nodoc
class __$$_MMArticleCopyWithImpl<$Res> extends _$MMArticleCopyWithImpl<$Res>
    implements _$$_MMArticleCopyWith<$Res> {
  __$$_MMArticleCopyWithImpl(
      _$_MMArticle _value, $Res Function(_$_MMArticle) _then)
      : super(_value, (v) => _then(v as _$_MMArticle));

  @override
  _$_MMArticle get _value => super._value as _$_MMArticle;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_MMArticle(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MMArticle implements _MMArticle {
  const _$_MMArticle(
      {required this.id, required this.title, required this.imageUrl});

  factory _$_MMArticle.fromJson(Map<String, dynamic> json) =>
      _$$_MMArticleFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'MMArticle(id: $id, title: $title, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MMArticle &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_MMArticleCopyWith<_$_MMArticle> get copyWith =>
      __$$_MMArticleCopyWithImpl<_$_MMArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MMArticleToJson(
      this,
    );
  }
}

abstract class _MMArticle implements MMArticle {
  const factory _MMArticle(
      {required final String id,
      required final String title,
      required final String imageUrl}) = _$_MMArticle;

  factory _MMArticle.fromJson(Map<String, dynamic> json) =
      _$_MMArticle.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_MMArticleCopyWith<_$_MMArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
