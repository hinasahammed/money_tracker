import 'package:flutter/material.dart';
import 'package:take_care/box/boxes.dart';
import 'package:take_care/model/transactions_model.dart';
import 'package:take_care/screens/tab_screen/widget/radio_button_custom.dart';

class SubmitButton extends StatelessWidget {
  final String titleController;
  final String amountController;
  final DateTime selectTime;
  final CategoryType selectedcategory;
  const SubmitButton({
    super.key,
    required this.titleController,
    required this.amountController,
    required this.selectTime,
    required this.selectedcategory,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () {
        saveData(context);
        Navigator.pop(context);
      },
      child: const Text(
        'Submit',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  void saveData(BuildContext context) async {
    final data = TransactionsModel(
      id: '21423',
      title: titleController,
      amount: amountController,
      date: selectTime,
      transactionType: selectedTransactionNotifier.value,
      categoryType: selectedcategory,
    );

    final box = Boxes.getData();
    box.add(data);
    data.save();
    print(box);
  }
}
