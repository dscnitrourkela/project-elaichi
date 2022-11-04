// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get transactionID => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      String transactionID,
      TransactionType type,
      User user,
      String userID,
      DateTime timestamp,
      int amount,
      String? comment});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionID = null,
    Object? type = null,
    Object? user = null,
    Object? userID = null,
    Object? timestamp = null,
    Object? amount = null,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionID: null == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String transactionID,
      TransactionType type,
      User user,
      String userID,
      DateTime timestamp,
      int amount,
      String? comment});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$_Transaction>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionID = null,
    Object? type = null,
    Object? user = null,
    Object? userID = null,
    Object? timestamp = null,
    Object? amount = null,
    Object? comment = freezed,
  }) {
    return _then(_$_Transaction(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      transactionID: null == transactionID
          ? _value.transactionID
          : transactionID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction implements _Transaction {
  const _$_Transaction(
      {required this.id,
      required this.transactionID,
      required this.type,
      required this.user,
      required this.userID,
      required this.timestamp,
      required this.amount,
      this.comment});

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  final String id;
  @override
  final String transactionID;
  @override
  final TransactionType type;
  @override
  final User user;
  @override
  final String userID;
  @override
  final DateTime timestamp;
  @override
  final int amount;
  @override
  final String? comment;

  @override
  String toString() {
    return 'Transaction(id: $id, transactionID: $transactionID, type: $type, user: $user, userID: $userID, timestamp: $timestamp, amount: $amount, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionID, transactionID) ||
                other.transactionID == transactionID) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, transactionID, type, user,
      userID, timestamp, amount, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final String transactionID,
      required final TransactionType type,
      required final User user,
      required final String userID,
      required final DateTime timestamp,
      required final int amount,
      final String? comment}) = _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  String get id;
  @override
  String get transactionID;
  @override
  TransactionType get type;
  @override
  User get user;
  @override
  String get userID;
  @override
  DateTime get timestamp;
  @override
  int get amount;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
