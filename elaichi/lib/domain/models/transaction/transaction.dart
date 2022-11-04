import 'package:elaichi/data/constants/global_enums.dart';
import 'package:elaichi/domain/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required String transactionID,
    required TransactionType type,
    required User user,
    required String userID,
    required DateTime timestamp,
    required int amount,
    String? comment,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
