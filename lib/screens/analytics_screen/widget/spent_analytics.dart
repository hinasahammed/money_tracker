import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../box/boxes.dart';
import '../../../model/transactions_model.dart';

class SpentAnalytics extends StatelessWidget {
  const SpentAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<TransactionsModel>>(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, box, _) {
        var data = box.values
            .where((type) => type.transactionType == TransactionType.expense)
            .toList()
            .cast<TransactionsModel>()
            .reversed
            .toList();
        var foodData = data
            .where((category) => category.categoryType == CategoryType.food);
        double totalFoodExpense = 0.0;

        for (var transaction in foodData) {
          final amountString = transaction.amount;
          final amount = double.tryParse(amountString);
          if (amount != null) {
            totalFoodExpense += amount;
          }
        }

        var transportData = data.where(
            (category) => category.categoryType == CategoryType.transport);
        double totalTransportExpense = 0.0;

        for (var transaction in transportData) {
          final amountString = transaction.amount;
          final amount = double.tryParse(amountString);
          if (amount != null) {
            totalTransportExpense += amount;
          }
        }

        var rentData = data
            .where((category) => category.categoryType == CategoryType.rent);
        double totalRentExpense = 0.0;

        for (var transaction in rentData) {
          final amountString = transaction.amount;
          final amount = double.tryParse(amountString);
          if (amount != null) {
            totalRentExpense += amount;
          }
        }
        var etcData =
            data.where((category) => category.categoryType == CategoryType.etc);
        double totalEtcExpense = 0.0;

        for (var transaction in etcData) {
          final amountString = transaction.amount;
          final amount = double.tryParse(amountString);
          if (amount != null) {
            totalEtcExpense += amount;
          }
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   'Spent details',
            //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            //         color: Theme.of(context).colorScheme.inverseSurface,
            //       ),
            // )
            Card(
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: foodData.isEmpty
                                  ? 0
                                  : foodData.length.toDouble() + 10,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.error,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Food',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                            Text(
                              '₹${totalFoodExpense.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: transportData.isEmpty
                                  ? 0
                                  : transportData.length.toDouble() + 10,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.error,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Transport',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                            Text(
                              '₹${totalTransportExpense.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: rentData.isEmpty
                                  ? 0
                                  : rentData.length.toDouble() + 10,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.error,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rent',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                            Text(
                              '₹${totalRentExpense.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: etcData.isEmpty
                                  ? 0
                                  : etcData.length.toDouble() + 10,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.error,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Etc',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                            Text(
                              '₹${totalEtcExpense.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
