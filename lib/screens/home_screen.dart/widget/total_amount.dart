import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../box/boxes.dart';
import '../../../model/transactions_model.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TransactionsModel>>(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, box, _) {
        var expenseData = box.values
            .where((type) => type.transactionType == TransactionType.expense)
            .toList()
            .cast<TransactionsModel>();
        final totalExpense = expenseData
            .map((expense) => int.parse(expense.amount))
            .reduce((a, b) => a + b);

        var incomeData = box.values
            .where((type) => type.transactionType == TransactionType.income)
            .toList()
            .cast<TransactionsModel>();
        final totalIncome = incomeData
            .map((income) => int.parse(income.amount))
            .reduce((a, b) => a + b);
        return Card(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Income',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          '₹${totalIncome.toString()}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Total Expense',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          '₹${totalExpense.toString()}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
