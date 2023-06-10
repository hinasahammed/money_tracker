import 'package:hive/hive.dart';
import 'package:take_care/model/transactions_model.dart';

class Boxes {
  static Box<TransactionsModel> getData() =>
      Hive.box<TransactionsModel>('paisa');
}
