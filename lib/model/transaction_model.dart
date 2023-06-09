enum TransactionType {
  income,
  expense,
}

enum CategoryType {
  food,
  transport,
  rent,
  etc,
}

class TransactioinModel {
  final String id;
  final String title;
  final String amount;
  final DateTime date;
  final TransactionType transactionType;
  final CategoryType categoryType;

  TransactioinModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.transactionType,
    required this.categoryType,
  });
}
