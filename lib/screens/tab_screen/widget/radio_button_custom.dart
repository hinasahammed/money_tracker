import 'package:flutter/material.dart';

import '../../../model/transactions_model.dart';

ValueNotifier<TransactionType> selectedTransactionNotifier =
    ValueNotifier(TransactionType.income);

class RadioButtonCustom extends StatelessWidget {
  final String title;
  final TransactionType type;
  const RadioButtonCustom({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedTransactionNotifier,
        builder: (BuildContext ctx, TransactionType newTransaction, Widget? _) {
          return Row(
            children: [
              Radio<TransactionType>(
                value: type,
                groupValue: selectedTransactionNotifier.value,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  selectedTransactionNotifier.value = value;
                  // selectedTransactionNotifier.notifyListeners();
                },
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              )
            ],
          );
        });
  }
}
