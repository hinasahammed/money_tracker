import 'package:hive/hive.dart';
part 'transactions_model.g.dart';

@HiveType(typeId: 1)
enum TransactionType {
  @HiveField(0)
  income,

@HiveField(1)
  expense,
}

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  food,

@HiveField(1)
  transport,

@HiveField(2)
  rent,

@HiveField(3)
  etc,
}

@HiveType(typeId: 0)
class TransactionsModel extends HiveObject {
  @HiveField(0)
  final String id;

@HiveField(1)
  final String title;

@HiveField(2)
  final String amount;

@HiveField(3)
  final DateTime date;

@HiveField(4)
  final TransactionType transactionType;

@HiveField(5)
  final CategoryType categoryType;

  TransactionsModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.transactionType,
    required this.categoryType,
  });
}
